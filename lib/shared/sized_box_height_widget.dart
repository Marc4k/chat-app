import 'screen_adaption.dart';
import 'package:flutter/material.dart';

class SizedBoxHeightWidget extends StatelessWidget {
  const SizedBoxHeightWidget({Key? key, required this.height})
      : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height * sH(context));
  }
}
