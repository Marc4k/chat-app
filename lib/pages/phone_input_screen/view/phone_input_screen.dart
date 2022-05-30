import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/screen_adaption.dart';
import '../../../constants/colors.dart';
import '../../phone_verification_screen/view/phone_verification_screen.dart';
import '../widget/phone_input_widget.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({Key? key}) : super(key: key);

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
              EdgeInsets.fromLTRB(24 * sW(context), 0, 24 * sW(context), 0),
          child: Column(
            children: [
              SizedBoxHeightWidget(height: 98),
              CustomTextWidget(
                  text: "Enter Your Phone Number", style: heading2Style),
              SizedBoxHeightWidget(height: 8),
              CustomTextWidget(
                  text:
                      "Please confirm your country code and enter \n your phone number",
                  style: body2Style),
              SizedBoxHeightWidget(height: 48),
              PhoneNumberInputWidget(),
              SizedBoxHeightWidget(height: 81),
              ButtonWidget(
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return PhoneVerificationScreen();
                    }));
                  },
                  text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
