import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/domain/user_auth/user_auth_impl.dart';
import 'package:chat_app/error/failures.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_input_field.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  String error = "";

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
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextWidget(
                    text: "Let's get started!", style: heading2Style),
                SizedBox(height: 48.h),
                CustomEmailFieldWidget(
                    hintText: "Enter your E-Mail", controller: email),
                SizedBox(height: 20.h),
                CustomPasswordFieldWidget(
                    hintText: "Enter your Password", controller: password1),
                SizedBox(height: 20.h),
                CustomPasswordFieldWidget(
                    hintText: "Enter your Password again",
                    controller: password2),
                SizedBox(height: 10.h),
                CustomTextWidget(text: error, style: errorStyle),
                SizedBox(height: 98.h),
                ButtonWidget(
                    callback: () async {
                      dynamic test = await UserAuthImpl()
                          .signUpUser(email.text, password1.text);

                      /*Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return PhoneVerificationScreen();
                      }));*/
                    },
                    text: "Continue"),
                SizedBox(height: 150.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
