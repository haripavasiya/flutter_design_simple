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

class Send_Reffreal_Screen extends StatefulWidget {
  const Send_Reffreal_Screen({Key? key}) : super(key: key);

  @override
  State<Send_Reffreal_Screen> createState() => _Send_ReffrealState();
}

class _Send_ReffrealState extends State<Send_Reffreal_Screen> {
  TextEditingController name_Controller =TextEditingController();
  TextEditingController customer_name_Controller =TextEditingController();
  TextEditingController categoryController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.RED,
        elevation: 1,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Send Reffreal",
            textAlign: TextAlign.start,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: Dimensions.FONT_SIZE_15)),
      ),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Business category
            Title_EditFild("Business category"),
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                    ]
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: categoryController,
                      maxLines: 1,
                      enabled: false,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Select Category',
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: 12),
                        errorStyle: TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Person name
            Title_EditFild("Customer name"),
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                    ]
                ),
                height: AppConstants.itemWidth*0.1,
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: customer_name_Controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.name,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter Customer name',
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: 12),
                        errorStyle: TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Business name
            Title_EditFild("Name"),
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                    ]
                ),
                height: AppConstants.itemWidth*0.1,
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: name_Controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.name,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: 12),
                        errorStyle: TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Submit Button
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 1500), content: Text('Reffreal Send SuccessFully'), backgroundColor: Colors.green));
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashBoard_Screen()));
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.015),
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_PRIMERY,
                    borderRadius:BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                    ]
                ),
                child:Text("Submit",
                    style: montserratRegular.copyWith(
                        color: ColorResources.WHITE,
                        fontSize: Dimensions.FONT_SIZE_14)),
              ),
            ),
          ],
        ),
      ),
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
