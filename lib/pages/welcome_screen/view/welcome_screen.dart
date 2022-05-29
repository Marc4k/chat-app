import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

import '../../phone_input_screen/view/phone_input_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                callback: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return PhoneInputScreen();
                  }));
                },
                text: "Start Messaging"),
          ],
        ),
      ),
    );
  }
}
