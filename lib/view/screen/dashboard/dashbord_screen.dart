import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sbn/view/screen/dashboard/widget/drawer_view.dart';
import 'package:sbn/view/screen/send_reffreal/send_reffreal_screen.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../business_profile/profile_screen.dart';
import '../setting/setting_screen.dart';
import '../your_reffreal/your_reffreal_screen.dart';

class DashBoard_Screen extends StatefulWidget {
  const DashBoard_Screen({Key? key}) : super(key: key);

  @override
  State<DashBoard_Screen> createState() => _DashBoard_ScreenState();
}

class _DashBoard_ScreenState extends State<DashBoard_Screen> {
  bool status=true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Scaffold(
        backgroundColor: ColorResources.getWhite(context),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorResources.COLOR_PRIMERY,
          automaticallyImplyLeading: false,
          title: Text("Welcome to SBN",
              textAlign: TextAlign.center,
              style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: AppConstants.itemWidth * 0.045,
              )),
          elevation: 0,
        ),
        key: _scaffoldKey,
        drawer: Drawer_View(),
        body:Column(
          children: [
            Container(
              height: AppConstants.itemHeight*0.1,
              decoration: BoxDecoration(
                color: ColorResources.COLOR_PRIMERY,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Expanded(child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Business Name",
                                style: montserratMedium.copyWith(
                                    color: ColorResources.WHITE,
                                    fontSize: Dimensions.FONT_SIZE_15)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Business Category",
                                style: montserratMedium.copyWith(
                                    color: ColorResources.WHITE,
                                    fontSize: Dimensions.FONT_SIZE_15)),
                          ),
                        ],
                      ),
                    ],
                  )),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(AppConstants.itemHeight*0.5)),
                    child: CachedNetworkImage(
                      imageUrl: "https://xsgames.co/randomusers/assets/avatars/male/74.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        height: AppConstants.itemHeight*0.09,
                        width: AppConstants.itemHeight*0.09,
                        decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(color: ColorResources.BLACK.withOpacity(0.2),blurRadius: 1)
                          ],
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill),
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(Images.logo,height: AppConstants.itemHeight*0.1,
                        width: AppConstants.itemHeight*0.1,fit: BoxFit.fill,),
                      progressIndicatorBuilder: (context, url, downloadProgress) => Container(height: AppConstants.itemHeight*0.1,
                          width: AppConstants.itemHeight*0.1,child: Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),)),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: AppConstants.itemWidth*0.02,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: AppConstants.itemWidth*0.05,),
                Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Send_Reffreal_Screen(),));
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.BLACK.withOpacity(0.5),
                          blurRadius: 1
                        )
                      ]
                    ),
                    alignment: Alignment.center,
                    child: Text("Send\nReffreal",textAlign: TextAlign.center,style: montserratMedium),
                  ),
                )),
                SizedBox(width: AppConstants.itemWidth*0.05,),
                Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile_Screen("home"),));
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.5),
                              blurRadius: 1
                          )
                        ]
                    ),
                    alignment: Alignment.center,
                    child: Text("Edit\nProfile",
                        textAlign: TextAlign.center,
                        style: montserratMedium),
                  ),
                )),
                SizedBox(width: AppConstants.itemWidth*0.05,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: AppConstants.itemWidth*0.05,),
                Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Your_Reffreal_Screen(),));
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.5),
                              blurRadius: 1
                          )
                        ]
                    ),
                    alignment: Alignment.center,
                    child: Text("Your\nReffreal",textAlign: TextAlign.center,style: montserratMedium),
                  ),
                )),
                SizedBox(width: AppConstants.itemWidth*0.05,),
                Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting_Screen(),));
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.5),
                              blurRadius: 1
                          )
                        ]
                    ),
                    alignment: Alignment.center,
                    child: Text("Setting",
                        textAlign: TextAlign.center,
                        style: montserratMedium),
                  ),
                )),
                SizedBox(width: AppConstants.itemWidth*0.05,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
