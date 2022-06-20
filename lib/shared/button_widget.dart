import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import 'custom_text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.callback,
      required this.text,
      required this.isLoading})
      : super(key: key);
  final VoidCallback callback;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: isLoading
          ? SpinKitWave(
              color: CustomColors.textColor,
              size: 25.r,
              type: SpinKitWaveType.start,
            )
          : CustomTextWidget(text: text, style: subheading2Style),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: CustomColors.brandDefault,
          fixedSize: Size(double.maxFinite, 48.h)),
    );
  }
}
