import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sbn/view/screen/auth/forgot_password_screen.dart';
import 'package:sbn/view/screen/dashboard/dashbord_screen.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../business_profile/profile_screen.dart';

class Sign_In_Screen extends StatefulWidget {
  const Sign_In_Screen({Key? key}) : super(key: key);

  @override
  State<Sign_In_Screen> createState() => _Sign_In_ScreenState();
}

class _Sign_In_ScreenState extends State<Sign_In_Screen> {
  TextEditingController mono_controller =TextEditingController();
  TextEditingController password_controller =TextEditingController();
  FocusNode monoFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorResources.WHITE,
          body:SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: AppConstants.itemHeight*0.12,),
                  Container(
                    child: Image.asset(Images.logo, width: AppConstants.itemHeight*0.2),
                  ),
                  SizedBox(height: AppConstants.itemWidth*0.15,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
                    decoration: BoxDecoration(
                        color: ColorResources.BLACK.withOpacity(0.1),
                        borderRadius:BorderRadius.circular(10),
                        border: Border.all(color: ColorResources.GREY,width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: mono_controller,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            focusNode: monoFocus,
                            keyboardType: TextInputType.number,
                            initialValue: null,
                            textInputAction: TextInputAction.next,
                            style: montserratMedium.copyWith(color: ColorResources.BLACK),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            onChanged: (value){
                              if(value.length==10){
                                AppConstants.closeKeyboard();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                              isDense: true,
                              counterText: '',
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                              hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor),
                              errorStyle: TextStyle(height: 1.5),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppConstants.itemHeight*0.02,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
                    decoration: BoxDecoration(
                        color: ColorResources.BLACK.withOpacity(0.1),
                        borderRadius:BorderRadius.circular(10),
                        border: Border.all(color: ColorResources.GREY,width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: password_controller,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            focusNode: passwordFocus,
                            keyboardType: TextInputType.text,
                            initialValue: null,
                            textInputAction: TextInputAction.done,
                            style: montserratMedium.copyWith(color: ColorResources.BLACK),
                            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                            onChanged: (value){
                              if(value.length==10){
                                AppConstants.closeKeyboard();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                              isDense: true,
                              counterText: '',
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                              hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor),
                              errorStyle: TextStyle(height: 1.5),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppConstants.itemHeight*0.04,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Profile_Screen("login"),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_PRIMERY,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.2),
                      padding: EdgeInsets.symmetric(vertical:12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Login",
                                textAlign: TextAlign.center,
                                style: montserratBold.copyWith(
                                  color: ColorResources.WHITE,
                                  fontSize: AppConstants.itemWidth * 0.045,
                                )),
                          ]),
                    ),
                  ),
                  SizedBox(height: AppConstants.itemWidth*0.1,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_Password_Screen(),));
                          },
                          child: Text("Forgot Password?",
                              textAlign: TextAlign.center,
                              style: montserratMedium.copyWith(
                                color: ColorResources.COLOR_PRIMERY,
                                fontSize: AppConstants.itemWidth * 0.045,
                              )),
                        ),
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}