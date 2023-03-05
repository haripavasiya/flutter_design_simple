import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';

class CustomTextTitle extends StatelessWidget {
  final String icon;
  final String title;

  CustomTextTitle(
      {required this.icon,required this.title});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2),
      margin: EdgeInsets.only(bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon,height: AppConstants.itemWidth*0.05,width: AppConstants.itemWidth*0.05,),
          SizedBox(width: AppConstants.itemWidth*0.02,),
          Text(title,
              textAlign: TextAlign.start,
              style: montserratMedium.copyWith(color:ColorResources.WHITE, fontSize: Dimensions.FONT_SIZE_15)),
        ],
      ),
    );
  }
}
