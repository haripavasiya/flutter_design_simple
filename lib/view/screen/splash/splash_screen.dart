import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../helper/preferenceutils.dart';
import '../../../provider/splash_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/no_internet_screen.dart';
import '../auth/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  bool? isNotConnected=true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    AppConstants.closeKeyboard();
    PreferenceUtils.init();
    Provider.of<SplashProvider>(context, listen: false).setConnectionCheck(context).then((value){
      Provider.of<SplashProvider>(context, listen: false).isNetwork?_loadData(context):null;
    });
    AppConstants.closeKeyboard();
  }

  Future<void> _loadData(BuildContext context) async {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Sign_In_Screen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }

  @override
  Widget build(BuildContext context) {
    AppConstants.screenSize=MediaQuery.of(context).size;
    AppConstants.itemHeight=MediaQuery.of(context).size.height;
    AppConstants.itemWidth=MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () => AppConstants.onWillPop(context),
        child: Consumer<SplashProvider>(builder: (context,splash_provider,child){
          return SafeArea(
            child: Scaffold(
              backgroundColor: ColorResources.getWhite(context),
              body:splash_provider.isNetwork
                  ?
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: AppConstants.itemWidth,
                      height: AppConstants.itemHeight,
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.15),
                      child:Image.asset(Images.logo),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: AppConstants.itemWidth,
                      height: AppConstants.itemHeight,
                      padding: EdgeInsets.all(AppConstants.itemHeight*0.21),
                      child:Image.asset(Images.loading_gif),
                    ),
                  ),
                ],
              )
                  :
              NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
            ),
          );
        })
    );
  }
}