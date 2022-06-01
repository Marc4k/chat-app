import 'package:badges/badges.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:flutter/material.dart';

class BadgedWidget extends StatelessWidget {
  const BadgedWidget({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Badge(
        badgeColor: CustomColors.brandBg,
        animationType: BadgeAnimationType.fade,
        badgeContent:
            CustomTextWidget(text: count.toString(), style: metadata3Style));
  }
}
