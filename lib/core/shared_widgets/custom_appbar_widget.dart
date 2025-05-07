import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/text_styles.dart';
import '../styles/colors.dart';

appBarContent({required String title, required BuildContext context}) {
  return AppBar(
      title: Text(title, style: StyleManger.almostBlack25w400()),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: SizedBox(
        width: 20,
        height: 35,
        child: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: const Icon(Icons.keyboard_arrow_left_sharp, size:  40,color: ColorManger.black,),
        ),
      ));
}
