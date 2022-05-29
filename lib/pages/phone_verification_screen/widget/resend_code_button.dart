import 'package:chat_app/shared/screen_adaption.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({Key? key, required this.callback}) : super(key: key);
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: callback,
        child: Text(
          "Resend Code",
          textScaleFactor: textscale(context),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish",
            color: CustomColors.brandDefault,
          ),
        ));
  }
}
