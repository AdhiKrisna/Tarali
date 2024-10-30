import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarali/constants/constant_colors.dart';

class PoppinsStyle {
    static stylePoppins({
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      double? height,
      TextDecoration? decoration,
    })
    {
      return GoogleFonts.poppins(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? white,
        height: height ?? 1,
        decoration: decoration,
      );
    }
}