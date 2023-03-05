
import '../../../utill/dimensions.dart';
import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';
import '../../utill/styles.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final bool transparent;

  CustomButton({required this.onPressed,
    required this.buttonText,
    this.transparent = false});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null ? Theme.of(context).disabledColor : transparent ? Colors.transparent : Theme.of(context).primaryColor,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );

    return Center(child: SizedBox(child: Padding(
      padding:EdgeInsets.all(0) ,
      child: TextButton(
        onPressed: onPressed(),
        style: _flatButtonStyle,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(buttonText, textAlign: TextAlign.center, style: montserratBold.copyWith(
            color: transparent ? Theme.of(context).primaryColor : ColorResources.COLOR_PRIMERY,
            fontSize:Dimensions.FONT_SIZE_15,
          )),
        ]),
      ),
    )));
  }
}
