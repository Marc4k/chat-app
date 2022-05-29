import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        backgroundColor: Colors.transparent,
        pinTheme: PinTheme(
          selectedColor: Colors.black,
          activeColor: Colors.black,
          inactiveColor: Colors.black,
          shape: PinCodeFieldShape.circle,
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
        ),
        appContext: context,
        length: 4,
        onChanged: (value) {});
  }
}
