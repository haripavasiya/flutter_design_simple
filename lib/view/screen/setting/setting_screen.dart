import 'package:flutter/material.dart';
import 'package:sbn/view/screen/auth/sign_in_screen.dart';
import 'package:sbn/view/screen/setting/smc_screen.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.RED,
        elevation: 1,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Setting",
            textAlign: TextAlign.start,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: Dimensions.FONT_SIZE_15)),
      ),
      backgroundColor: ColorResources.WHITE,
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        physics: ClampingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SMC_Screen("Term and Conditions"),));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius:BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                  ]
              ),
              child: Row(
                children: [
                  Expanded(child: Text("Term and Conditions",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 13)))
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SMC_Screen("Privacy Policy"),));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius:BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                  ]
              ),
              child: Row(
                children: [
                  Expanded(child: Text("Privacy Policy",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 13)))
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SMC_Screen("About US"),));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius:BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                  ]
              ),
              child: Row(
                children: [
                  Expanded(child: Text("About US",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 13)))
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>Sign_In_Screen(),)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius:BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                  ]
              ),
              child: Row(
                children: [
                  Expanded(child: Text("Logout",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 13)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
