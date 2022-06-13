import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.callback, required this.text})
      : super(key: key);
  final VoidCallback callback;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: CustomTextWidget(text: text, style: subheading2Style),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: CustomColors.brandDefault,
          fixedSize: Size(double.maxFinite, 48.h)),
    );
  }
}
