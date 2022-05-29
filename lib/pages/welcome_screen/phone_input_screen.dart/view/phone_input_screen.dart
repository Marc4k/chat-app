import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/screen_adaption.dart';
import '../widget/phone_input_widget.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(24 * sW(context), 0, 24 * sW(context), 0),
          child: Column(
            children: [
              SizedBoxHeightWidget(height: 140),
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
              ButtonWidget(callback: () {}, text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
