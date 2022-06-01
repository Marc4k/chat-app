import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_input_field.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/screen_adaption.dart';
import '../../../constants/colors.dart';
import '../../phone_verification_screen/view/phone_verification_screen.dart';
import '../widget/phone_input_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
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
                  text: "Let's get started!", style: heading2Style),
              SizedBoxHeightWidget(height: 48),
              CustomInputFieldWidget(
                  hintText: "Enter your E-Mail", controller: email),
              SizedBoxHeightWidget(height: 20),
              CustomInputFieldWidget(
                  hintText: "Enter your Password", controller: password1),
              SizedBoxHeightWidget(height: 20),
              CustomInputFieldWidget(
                  hintText: "Enter your Password again", controller: password2),
              SizedBoxHeightWidget(height: 20),
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
