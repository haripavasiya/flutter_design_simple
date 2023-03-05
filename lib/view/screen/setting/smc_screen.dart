import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';

class SMC_Screen extends StatefulWidget {
  String title;
  SMC_Screen(this.title, {Key? key}) : super(key: key);

  @override
  State<SMC_Screen> createState() => _SMC_ScreenState();
}

class _SMC_ScreenState extends State<SMC_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.RED,
        elevation: 1,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(widget.title,
            textAlign: TextAlign.start,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: Dimensions.FONT_SIZE_15)),
      ),
      backgroundColor: ColorResources.WHITE,
    );
  }
}
