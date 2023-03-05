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

class Profile_Screen extends StatefulWidget {
  String type;
  Profile_Screen(this.type, {Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Profile_Screen> {
  File imageFile = File("");
  ImageCropper imagecropp = new ImageCropper();
  TextEditingController email_Controller =TextEditingController();
  TextEditingController mobile_noController =TextEditingController();
  TextEditingController name_Controller =TextEditingController();
  TextEditingController business_name_Controller =TextEditingController();
  TextEditingController addressController =TextEditingController();
  TextEditingController categoryController =TextEditingController();

  Future get_Multiple_Image(ImageSource sourcepath,String type) async {
    final ImagePicker imagePicker = new ImagePicker();
    final XFile? pickedFile =
    await imagePicker.pickImage(source: sourcepath, imageQuality: 50);
    File? file = File(imageFile.path);
    if (pickedFile != null) {
      CroppedFile? cropped = (await imagecropp.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
          compressQuality: 40,
          maxHeight: 500,
          maxWidth: 500,
          compressFormat: ImageCompressFormat.jpg,
          uiSettings: [
            IOSUiSettings(minimumAspectRatio: 1.0,),
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: ColorResources.GREY,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.square,
                lockAspectRatio: false),
          ])); /*as File?;*/
      setState(() {
        if (cropped != null) {
          // Provider.of<AuthProvider>(context, listen: false).File_Upload_API_CALL(File(cropped.path));
        }
      });
    }
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.RED,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          if(widget.type=="home"){
            Navigator.pop(context);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard_Screen(),));
          }
        }, icon: Icon(Icons.arrow_back,color: ColorResources.WHITE,)),
        title: Text("Profile",
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
            //image
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 9),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius:BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.BLACK.withOpacity(0.25),
                      blurRadius: 2,
                    )
                  ]
              ),
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                              AppConstants.itemWidth * 0.08,
                              vertical:
                              AppConstants.itemHeight * 0.02),
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      SimpleDialogOption(
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 40,
                                          color: ColorResources.COLOR_PRIMERY,
                                        ),
                                        onPressed: () {
                                          get_Multiple_Image(ImageSource.camera,"1");
                                          Navigator.pop(context);
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: Text("Camera",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily:
                                                'Montserrat',
                                                fontSize: 16)),
                                        onPressed: () {
                                          get_Multiple_Image(ImageSource.camera,"1");
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SimpleDialogOption(
                                        child: Icon(
                                            Icons.photo_camera_back,
                                            size: 40,
                                            color: ColorResources.COLOR_PRIMERY),
                                        onPressed: () {
                                          get_Multiple_Image(ImageSource.gallery,"1");
                                          Navigator.pop(context);
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: Text(
                                          "Gallery",
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontFamily:
                                              'Montserrat',
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          get_Multiple_Image(ImageSource.gallery,"1");
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.add,color: ColorResources.BLACK.withOpacity(0.25),size: AppConstants.itemWidth*0.2,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Business Photo(Visiting Card)",
                    style: montserratRegular.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: Dimensions.FONT_SIZE_14)),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Email
            Title_EditFild("Email"),
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
                    Icon(Icons.email,color: ColorResources.GREY,size: 17,),
                    Expanded(child: TextFormField(
                      controller: email_Controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter your email id',
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
            Title_EditFild("Person name"),
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
                    Icon(Icons.person,color: ColorResources.GREY,size: 17,),
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

            //Business name
            Title_EditFild("Business name"),
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
                    Icon(Icons.business,color: ColorResources.GREY,size: 17,),
                    Expanded(child: TextFormField(
                      controller: business_name_Controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.name,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter your business name',
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

            //Business address
            Title_EditFild("Business address"),
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
                    Icon(Icons.location_on_rounded,color: ColorResources.GREY,size: 17,),
                    Expanded(child: TextFormField(
                      controller: addressController,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter your business address',
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

            //Mobile Number
            Title_EditFild("Contact number"),
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
                    Icon(Icons.call,color: ColorResources.GREY,size: 17,),
                    Expanded(child: TextFormField(
                      controller: mobile_noController,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: 12),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: '+91',
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
                    Icon(Icons.category,color: ColorResources.GREY,size: 17,),
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

            //Submit Button
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 1500), content: Text('Profile Submit SuccessFully'), backgroundColor: Colors.green));
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

            SizedBox(height: AppConstants.itemHeight*0.02,),
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
