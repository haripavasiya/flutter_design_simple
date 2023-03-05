import 'package:flutter/cupertino.dart';

import '../../utill/color_resources.dart';
import '../../utill/dimensions.dart';
import '../../utill/styles.dart';

class Title_EditFild extends StatelessWidget {
  String title;
  Title_EditFild(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            textAlign: TextAlign.start,
            style: montserratMedium.copyWith(
                color: ColorResources.BLACK,
                fontSize: Dimensions.FONT_SIZE_14)),
      ],
    );
  }
}
