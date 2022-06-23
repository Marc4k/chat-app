import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

TextStyle heading1Style = TextStyle(
  fontSize: 32.sp,
  fontWeight: FontWeight.w700,
  fontFamily: "Mulish",
  color: ColorChance().getTextColor(),
);
TextStyle heading2Style = TextStyle(
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
  fontFamily: "Mulish",
  color: ColorChance().getTextColor(),
);

TextStyle body1Style = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  fontFamily: "Mulish",
  color: ColorChance().getTextColor(),
);

TextStyle body2Style = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w400,
  fontFamily: "Mulish",
  color: ColorChance().getTextColor(),
);

TextStyle chatStyleSender = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Mulish",
    color: Colors.white);

TextStyle chatStyleNotSender = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Mulish",
    color: Colors.black);

TextStyle subheading2Style = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  fontFamily: "Mulish",
  color: Color(0xFFF7F7FC),
);

TextStyle metadata1Style = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  fontFamily: "Mulish",
  color: Color(0xFFA4A4A4),
);

TextStyle metadata2Style = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w400,
  fontFamily: "Mulish",
  color: Color(0xFFADB5BD),
);

TextStyle metadata3Style = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w600,
  fontFamily: "Mulish",
  color: CustomColors.brandDarkColor,
);

TextStyle errorStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  fontFamily: "Mulish",
  color: Colors.red,
);
