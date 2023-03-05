import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sbn/utill/styles.dart';
import '../view/base/confirm_dialog_view.dart';
import 'color_resources.dart';

class AppConstants {

  static String APP_NAME = 'SBN';
  static String FILE_UPLOAD_API = 'http://squad.com.qa/api/fileupload';
  static String IMAGE_BASE_URL = 'http://squad.com.qa/image/';
  static const String BASE_URL = 'http://squad.com.qa/api/';

  static const String TOKEN = 'multivendor_token';
  static String THEME = 'theme';
  static String Token = 'Token';
  static String Firebase_Token = 'Firebase_Token';
  static const String COUNTRY_CODE = 'US';
  static const String LANGUAGE_CODE = 'en';

  //Screen Size
  static var screenSize;
  static double itemHeight=0.0;
  static double itemWidth=0.0;

  // Close KeyBoard
  static closeKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  // Dialog Box
  static Future<bool> onWillPop(BuildContext context) {
    return showDialog<bool>(
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Do you really want to quit?",
              leftButtonText: "No",
              rightButtonText: "Yes",
              onAgreeTap: () {
                SystemNavigator.pop();
              });
        }, context: context).then((value) => value ?? false);
  }

  // Email Check
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  // Toast
  static show_toast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Row(
        children: <Widget>[
          Radio<String>(
            groupValue: groupValue,
            value: value,
            activeColor: ColorResources.COLOR_PRIMERY,
            onChanged: (String? newValue) {onChanged(newValue!);},
          ),
          Text(label,style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK),),
        ],
      ),
    );
  }
}