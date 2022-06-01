import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Contacts",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: ColorChance().getTextColor(),
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
