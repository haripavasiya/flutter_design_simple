import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/edit_fild_title.dart';
import '../dashboard/dashbord_screen.dart';

class Your_Reffreal_Screen extends StatefulWidget {
  const Your_Reffreal_Screen({Key? key}) : super(key: key);

  @override
  State<Your_Reffreal_Screen> createState() => _Your_ReffrealState();
}

class _Your_ReffrealState extends State<Your_Reffreal_Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.RED,
        elevation: 1,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Your Reffreal",
            textAlign: TextAlign.start,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: Dimensions.FONT_SIZE_15)),
      ),
      backgroundColor: ColorResources.WHITE,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        physics: ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,),
            decoration: BoxDecoration(
                color: ColorResources.WHITE,
                borderRadius:BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                ]
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Status",textAlign: TextAlign.start,style: montserratMedium)),
                    Expanded(child: Text("Pending",textAlign: TextAlign.end,style: montserratMedium.copyWith(color: ColorResources.HOLIDAY_PRIMERY)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("Business Name : Fruit Basket Selling",textAlign: TextAlign.start,style: montserratMedium))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("Business Category : Fruit",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.7),fontSize: 13)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("Person Name : Rambhai Patel",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.7),fontSize: 13)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("Contact No : +919924935678",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.7),fontSize: 13)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("Address : Pramukh Darshan Society, Dabholi, Surat, Gujarat 395004",textAlign: TextAlign.start,style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.7),fontSize: 13)))
                  ],
                ),
              ],
            ),
          );
      },),
    );
  }

  route(bool isRoute,String message) async {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 1500), content: Text('Profile Submit SuccessFully'), backgroundColor: Colors.green));
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashBoard_Screen()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 1500), content: Text(message), backgroundColor: Colors.green));
    }
  }
}
