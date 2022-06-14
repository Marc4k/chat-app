import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/domain/user_auth/user_auth_impl.dart';
import 'package:chat_app/error/failures.dart';
import 'package:chat_app/pages/create_profil_screen/view/create_profil_screen.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_input_field.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:email_validator/email_validator.dart';
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
  bool isLoading = false;
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
                    isLoading: isLoading,
                    callback: () async {
                      if (password1.text.length > 6 &&
                          password2.text.length > 6 &&
                          EmailValidator.validate(email.text) == true) {
                        setState(() {
                          isLoading = true;
                        });
                        dynamic userData = await UserAuthImpl()
                            .signUpUser(email.text, password1.text);

                        userData.fold((userData) {
                          isLoading = false;
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return CreateProfilScreen();
                          }));
                        }, (failure) {
                          setState(() {
                            isLoading = false;
                            error = failure.errorMessage;
                          });
                        });
                      }
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
