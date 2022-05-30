import 'package:chat_app/pages/create_profil_screen/widget/input_field_profil_widget.dart';
import 'package:chat_app/pages/create_profil_screen/widget/select_picture_widget.dart';
import 'package:chat_app/shared/button_widget.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../shared/screen_adaption.dart';

class CreateProfilScreen extends StatelessWidget {
  const CreateProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorChance().getBackgroundColor(),
      appBar: AppBar(
        title: Text(
          "Your Profile",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(24 * sW(context), 0, 24 * sW(context), 0),
          child: Column(
            children: [
              SizedBoxHeightWidget(height: 59),
              SelelctPictureWidget(
                callback: () {},
              ),
              SizedBoxHeightWidget(height: 31),
              InputFieldProfilWidget(hintText: "First Name (Required)"),
              SizedBoxHeightWidget(height: 12),
              InputFieldProfilWidget(
                hintText: "Last Name (Optional)",
              ),
              SizedBoxHeightWidget(height: 70),
              ButtonWidget(callback: () {}, text: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
