import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/pages/sign_up_screen/view/sign_up_screen.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorChance().getBackgroundColor(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
        child: Column(
          children: [
            SizedBox(height: 135.h),
            Image.asset("assets/img/welcome_screen.png", height: 274.h),
            SizedBox(height: 42.h),
            CustomTextWidget(
              text:
                  "Connect easily with \n your family and friends over countries",
              style: heading2Style,
            ),
            SizedBox(height: 126.h),
            CustomTextWidget(text: "Terms & Privacy Policy", style: body1Style),
            SizedBox(height: 18.h),
            ButtonWidget(
                callback: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SignUpScreen();
                  }));
                },
                text: "Sign Up"),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () async {
                final FirebaseAuth _auth = FirebaseAuth.instance;
                await _auth.signOut();
              },
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(text: "You’re already a member?", style: body1Style),
                  TextSpan(
                      text: " Login",
                      style: TextStyle(
                          color: CustomColors.brandDefault,
                          fontWeight: FontWeight.w700,
                          fontSize: body1Style.fontSize,
                          fontFamily: body1Style.fontFamily)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
