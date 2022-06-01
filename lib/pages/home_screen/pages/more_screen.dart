import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "More",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
      ),
    );
  }
}
