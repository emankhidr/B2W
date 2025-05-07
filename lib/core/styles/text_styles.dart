import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class StyleManger {
  static TextStyle almostBlack25w400() => GoogleFonts.lato(
        color: ColorManger.almostBlack,
        fontWeight: FontWeight.w400,
        fontSize: 25.0 ,
      );
  static TextStyle almostBlack20w700() => GoogleFonts.lato(
        color: ColorManger.almostBlack,
        fontWeight: FontWeight.w700,
        fontSize: 20.0,
      );  static TextStyle almostBlack15w700() => GoogleFonts.lato(
        color: ColorManger.black,
        fontWeight: FontWeight.w700,
        fontSize: 20.0,
      ); static TextStyle darkGrey20w400() => GoogleFonts.lato(
        color: ColorManger.darkGray,
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
      );
  static TextStyle darkGray16w400() => GoogleFonts.roboto(
        color: ColorManger.darkGray,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      );  static TextStyle coolGray10w400() => GoogleFonts.roboto(
        color: ColorManger.coolGray,
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
      ); static TextStyle black16w400() => GoogleFonts.roboto(
        color: ColorManger.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.0 ,
      );static TextStyle black20bold() => GoogleFonts.roboto(
        color: ColorManger.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.0 ,
      );
  static TextStyle white18w700() => GoogleFonts.roboto(
        color: ColorManger.white,
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
      ); static TextStyle white12bold() => GoogleFonts.roboto(
        color: ColorManger.white,
        fontWeight: FontWeight.bold,
        fontSize: 12.0,
      );
  static TextStyle darkBlueGrey12w400() => GoogleFonts.roboto(
        color: ColorManger.darkBleuGrey,
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
      );
  static TextStyle graniteGray10w500() => GoogleFonts.roboto(
        color: ColorManger.graniteGray,
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
      );
}
