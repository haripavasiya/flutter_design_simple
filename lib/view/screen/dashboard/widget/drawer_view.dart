import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../helper/preferenceutils.dart';
import '../../../../utill/app_constants.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';
import '../../../base/confirm_dialog_view.dart';

class Drawer_View extends StatefulWidget{
  Drawer_View();
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<Drawer_View > {
  String mystring = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: ColorResources.COLOR_PRIMERY,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Image.asset(Images.logo, width: AppConstants.itemHeight*0.25),
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: ColorResources.WHITE,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: ListView(
                children: [
                  
                  SizedBox(height: AppConstants.itemWidth*0.05,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
                    decoration: BoxDecoration(
                        color: ColorResources.BLACK.withOpacity(0.1),
                        borderRadius:BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.05,),
                        Expanded(
                          child: Text("Profile",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.045,
                              )),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppConstants.itemWidth*0.05,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
                    decoration: BoxDecoration(
                      color: ColorResources.BLACK.withOpacity(0.1),
                      borderRadius:BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.05,),
                        Expanded(
                          child: Text("Booking",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.045,
                              )),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppConstants.itemWidth*0.05,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
                    decoration: BoxDecoration(
                      color: ColorResources.BLACK.withOpacity(0.1),
                      borderRadius:BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.05,),
                        Expanded(
                          child: Text("Contact us",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.045,
                              )),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppConstants.itemWidth*0.05,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
                    decoration: BoxDecoration(
                      color: ColorResources.BLACK.withOpacity(0.1),
                      borderRadius:BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.05,),
                        Expanded(
                          child: Text("Sign out",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.045,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Do you really want to sign out?",
              leftButtonText: "No",
              rightButtonText: "Yes",
              onAgreeTap: () async {
                PreferenceUtils.clear();
              });
        }).then((value) => value ?? false);
  }
}