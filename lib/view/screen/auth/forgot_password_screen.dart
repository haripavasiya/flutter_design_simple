import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/otp_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class Forgot_Password_Screen extends StatefulWidget {
  const Forgot_Password_Screen({Key? key}) : super(key: key);

  @override
  State<Forgot_Password_Screen> createState() => _Forgot_Password_ScreenState();
}

class _Forgot_Password_ScreenState extends State<Forgot_Password_Screen> {
  FocusNode _mobileFocus = FocusNode();
  FocusNode _verificationFocus = FocusNode();
  FocusNode _new_passwordFocus = FocusNode();
  FocusNode _confirm_passwordFocus = FocusNode();
  TextEditingController _verificationCode = TextEditingController();
  TextEditingController _new_password_controller = TextEditingController();
  TextEditingController _mobile_controller = TextEditingController();
  TextEditingController _confirm_password_controller = TextEditingController();
  late String otp;
  bool _is_loder=false;
  String status="0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    otp=Random().nextInt(9999).toString().padLeft(4, '0');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getWhite(context),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorResources.COLOR_PRIMERY,
          automaticallyImplyLeading: true,
          title: Text("Forgot Password",
              textAlign: TextAlign.center,
              style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: AppConstants.itemWidth * 0.045,
              )),
          elevation: 0,
        ),
        body: status=="0"?ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
          children: [
            SizedBox(height: AppConstants.itemHeight*0.12,),
            Container(
              child: Image.asset(Images.logo, height: AppConstants.itemHeight*0.17),
            ),
            SizedBox(height: AppConstants.itemHeight*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: AppConstants.itemWidth*0.03,),
                Flexible(
                  child: Text("We will send you a message to set or reset your new password",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,
                        color: ColorResources.getBlack(context)),),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.05,),
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
                      controller: _mobile_controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: _mobileFocus,
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
            SizedBox(height: AppConstants.itemHeight*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_mobile_controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1500),
                          content: Text("Please Enter Mobile Number"),
                          backgroundColor: Colors.red,
                        ));
                      }else if(_mobile_controller.text.length != 10){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                          content: Text("Please Enter Valid Mobile Number"),
                          backgroundColor: Colors.red,
                        ));
                      } else{
                        _is_loder=true;
                        AppConstants.closeKeyboard();
                        setState(() {
                          _is_loder=false;
                          Provider.of<OTPProvider>(context, listen: false).setReStart(context);
                          Provider.of<OTPProvider>(context, listen: false).startTimer(context);
                          status="1";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                          content: Text("OTP Sent Successfully"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.2,vertical: AppConstants.itemWidth*0.03),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_PRIMERY,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: ColorResources.GREY.withOpacity(0.5),blurRadius: 0.8)
                        ]
                    ),
                    child:  Text("Send Code",
                        style: montserratMedium.copyWith(
                            color: ColorResources.getWhite(context),
                            fontSize: AppConstants.itemWidth*0.04)),
                  ),
                ),
              ],
            ),
          ],
        )
            :
        status=="1"?Consumer<OTPProvider>(builder: (context, otp_provider, child){
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
            children: [
              SizedBox(height: AppConstants.itemHeight*0.12,),
              Container(
                child: Image.asset(Images.logo, height: AppConstants.itemHeight*0.17),
              ),
              SizedBox(height: AppConstants.itemWidth*0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: AppConstants.itemHeight*0.05,),
                  Flexible(
                    child: Text("Enter OTP code sent to your number +91 ${_mobile_controller.text}",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,
                          color: ColorResources.getBlack(context).withOpacity(0.5)),),
                  ),
                  SizedBox(width: AppConstants.itemHeight*0.05,),
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.03,),
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
                        controller: _verificationCode,
                        maxLines: 1,
                        maxLength: 4,
                        textAlign: TextAlign.left,
                        focusNode: _verificationFocus,
                        keyboardType: TextInputType.number,
                        initialValue: null,
                        textInputAction: TextInputAction.done,
                        style: montserratMedium.copyWith(color: ColorResources.BLACK),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (value){
                          if(value.length==4){
                            AppConstants.closeKeyboard();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter OTP',
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
              SizedBox(height: AppConstants.itemHeight*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _is_loder?
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05,vertical: AppConstants.itemWidth*0.015),
                      child: Center(
                        child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),
                      )
                  )
                      :GestureDetector(
                    onTap: () {
                      setState(() {
                        if(_verificationCode.text==''){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                            content: Text("Please Enter OTP"),
                            backgroundColor: Colors.red,
                          ));
                        }else if(_verificationCode.text==otp || _verificationCode.text=="9876"){
                          AppConstants.closeKeyboard();
                          status="2";
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                            content: Text("Please Enter Valid OTP"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.2,vertical: AppConstants.itemWidth*0.03),
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_PRIMERY,
                          borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                          boxShadow: [
                            BoxShadow(color: ColorResources.GREY.withOpacity(0.5),blurRadius: 0.8)
                          ]
                      ),
                      child:  Text("Verify",
                          style: montserratMedium.copyWith(
                              color: ColorResources.getWhite(context),
                              fontSize: AppConstants.itemWidth*0.04)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.04,),
              Visibility(
                visible: otp_provider.start == 0 ? false : true,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemWidth*0.01),
                    child: Text(
                        '00 : ${Provider.of<OTPProvider>(context, listen: false).start}',
                        style: montserratMedium.copyWith(
                            color: ColorResources.getBlack(context).withOpacity(0.5),
                            fontSize: Dimensions.FONT_SIZE_14)),
                  ),
                ),
              ),
              Visibility(
                visible: otp_provider.start == 0 ? true : false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('I didn’t receive a OTP! ',
                          style: montserratRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimensions.FONT_SIZE_14)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Provider.of<OTPProvider>(context, listen: false).setReStart(context);
                            Provider.of<OTPProvider>(context, listen: false).startTimer(context);
                            _is_loder=true;
                          });
                        },
                        child: Text('RESEND OTP',
                            style: montserratRegular.copyWith(
                                color: ColorResources.COLOR_PRIMERY,
                                decorationColor: ColorResources.BLACK,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.FONT_SIZE_14)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        })
            :
        ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
          children: [
            SizedBox(height: AppConstants.itemHeight*0.12,),
            Container(
              child: Image.asset(Images.logo, height: AppConstants.itemHeight*0.17),
            ),
            SizedBox(height: AppConstants.itemWidth*0.3,),
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
                      controller: _new_password_controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: _new_passwordFocus,
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
                        hintText: 'New Password',
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
                      controller: _confirm_password_controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: _confirm_passwordFocus,
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
                        hintText: 'Confirm Password',
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
            SizedBox(height: AppConstants.itemHeight*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _is_loder?
                Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05,vertical: AppConstants.itemWidth*0.015),
                    child: Center(
                      child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),
                    )
                )
                    :GestureDetector(
                  onTap: () {
                    setState(() {
                      if(_new_password_controller.text==''){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                          content: Text("Please Enter New Password"),
                          backgroundColor: Colors.red,
                        ));
                      }else if(_confirm_password_controller.text==''){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                          content: Text("Please Enter Confirm Password"),
                          backgroundColor: Colors.red,
                        ));
                      }else if(_confirm_password_controller.text!=_new_password_controller.text){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: const Duration(milliseconds: 1500),
                          content: Text("Password don't match"),
                          backgroundColor: Colors.red,
                        ));
                      }else{
                        AppConstants.closeKeyboard();
                        _is_loder=true;
                        setState(() {
                          _is_loder=false;
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 1500),
                          content: Text("Forgot Password Successfully"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.2,vertical: AppConstants.itemWidth*0.03),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_PRIMERY,
                        borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.02),
                        boxShadow: [
                          BoxShadow(color: ColorResources.GREY.withOpacity(0.5),blurRadius: 0.8)
                        ]
                    ),
                    child:  Text("UPDATE",
                        style: montserratMedium.copyWith(
                            color: ColorResources.getWhite(context),
                            fontSize: AppConstants.itemWidth*0.04)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmailChecker {
  static bool isNotValid(String email) {
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}

class CustomTextField1 extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;

  CustomTextField1(
      {this.controller,
        this.hintText,
        this.textInputType,
        this.maxLine,
        this.maxLength,
        this.focusNode,
        this.nextNode,
        this.textInputAction,
        this.isPhoneNumber = false,
        this.isValidator=false,
        this.validatorMessage,
        this.capitalization = TextCapitalization.none,
        this.fillColor});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: ColorResources.BG_EDIT_TEXT,
          borderRadius:BorderRadius.circular(AppConstants.itemWidth*0.02),
          boxShadow: [
            BoxShadow(color: ColorResources.getBlack(context).withOpacity(0.25),blurRadius: 1)
          ]
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine ?? 1,
        textCapitalization: capitalization,
        textAlign: TextAlign.center,
        maxLength: maxLength,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        initialValue: null,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        style: montserratRegular.copyWith(color: ColorResources.getBlack(context)),
        inputFormatters: [isPhoneNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter],
        onChanged: (value){
          if(value.length==4){
            AppConstants.closeKeyboard();
          }
        },
        decoration: InputDecoration(
          hintText: hintText ?? '',
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          isDense: true,
          counterText: '',
          hintStyle: montserratRegular.copyWith(color: ColorResources.GREY.withOpacity(0.5)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class FORGOTCustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;

  FORGOTCustomTextField(
      {this.controller,
        this.hintText,
        this.textInputType,
        this.maxLine,
        this.maxLength,
        this.focusNode,
        this.nextNode,
        this.textInputAction,
        this.isPhoneNumber = false,
        this.isValidator=false,
        this.validatorMessage,
        this.capitalization = TextCapitalization.none,
        this.fillColor});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: ColorResources.BG_EDIT_TEXT.withOpacity(0.25),
          borderRadius:BorderRadius.circular(AppConstants.itemWidth*0.02),
          boxShadow: [
            BoxShadow(color: ColorResources.getBlack(context).withOpacity(0.25),blurRadius: 1)
          ]
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine ?? 1,
        textCapitalization: capitalization,
        textAlign: TextAlign.start,
        maxLength: maxLength,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        initialValue: null,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        style: montserratRegular.copyWith(color: ColorResources.getWhite(context)),
        inputFormatters: [isPhoneNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter],
        validator: (input){
          if(input!.isEmpty){
            if(isValidator){
              return validatorMessage??"";
            }
          }
          return null;
        },
        onChanged: (input){
          if(input.length==10){
            AppConstants.closeKeyboard();
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
        decoration: InputDecoration(
          hintText: hintText ?? '',
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          isDense: true,
          counterText: '',
          hintStyle: montserratRegular.copyWith(color: ColorResources.GREY.withOpacity(0.5)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}