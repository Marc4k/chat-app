import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/pages/sign_up_screen/view/sign_up_screen.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorChance().getBackgroundColor(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24 * sW(context), 0, 24 * sW(context), 0),
        child: Column(
          children: [
            const SizedBoxHeightWidget(height: 135),
            Image.asset("assets/img/welcome_screen.png",
                height: 274 * sH(context)),
            const SizedBoxHeightWidget(height: 42),
            CustomTextWidget(
              text:
                  "Connect easily with \n your family and friends over countries",
              style: heading2Style,
            ),
            const SizedBoxHeightWidget(height: 126),
            CustomTextWidget(text: "Terms & Privacy Policy", style: body1Style),
            const SizedBoxHeightWidget(height: 18),
            ButtonWidget(
                callback: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SignUpScreen();
                  }));

                  //PhoneAuthRepositoryImpl()
                  //   .logUserInWithPhone("+43 650 2719052");

                  /*  FirebaseAuth auth = FirebaseAuth.instance;
                  final userData = await auth.signInWithEmailAndPassword(
                      email: "marc@gmx.at", password: "Maxwell187");

                  if (userData != null) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return HomeScreen();
                    }));
                  }*/
                },
                text: "Sign Up"),
            SizedBoxHeightWidget(height: 8),
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
