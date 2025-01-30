import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';


class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.title,
    this.fontWeight,
    this.height,
    this.fontSize = 14,
    this.color = AppColors.black,
    this.decoration,
    this.onTap,
    this.textAlign,
    this.fontFamily,
    this.maxLines,
    this.overflow,
    this.padding = EdgeInsets.zero,

  }) : super(key: key);

  final String title;
  final double? height ;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color color;
  final TextDecoration? decoration;
  final TextAlign  ? textAlign;
  final String ? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry padding;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          textAlign: textAlign,
          maxLines: maxLines ,
          overflow: overflow ,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: color,
            decoration: decoration,
            height: height != null ? height! /    fontSize : null,
          ),
        ),
      ),
    );
  }
}