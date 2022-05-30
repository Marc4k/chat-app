import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../shared/custom_text_widget.dart';
import '../../../shared/screen_adaption.dart';
import '../../../shared/sized_box_height_widget.dart';
import '../widget/pin_code_widget.dart';
import '../widget/resend_code_button.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorChance().getBackgroundColor(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorChance().getTextColor(),
        ),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(54 * sW(context), 0, 54 * sW(context), 0),
          child: Column(
            children: [
              SizedBoxHeightWidget(height: 98),
              CustomTextWidget(text: "Enter Code", style: heading2Style),
              SizedBoxHeightWidget(height: 8),
              CustomTextWidget(
                  text:
                      "We have sent you an SMS with the code to +62 1309 - 1710 - 1920",
                  style: body2Style),
              SizedBoxHeightWidget(height: 48),
              PinCodeWidget(),
              SizedBoxHeightWidget(height: 77),
              ResendCodeButton(
                callback: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
