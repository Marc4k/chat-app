import 'dart:io';

import '../../../domain/create_user/create_user_impl.dart';
import '../widget/input_field_profil_widget.dart';
import '../widget/select_picture_widget.dart';
import '../../home_screen/view/home_screen.dart';
import '../../../shared/button_widget.dart';
import '../../../shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../shared/custom_text_widget.dart';
import '../../../shared/screen_adaption.dart';

class CreateProfilScreen extends StatefulWidget {
  const CreateProfilScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfilScreen> createState() => _CreateProfilScreenState();
}

String error = "";
File? imageTemorary;
bool isLoading = false;

TextEditingController name = TextEditingController();

class _CreateProfilScreenState extends State<CreateProfilScreen> {
  void PickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    setState(() {
      imageTemorary = File(pickedFile.path);
    });
  }

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
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(24 * sW(context), 0, 24 * sW(context), 0),
          child: Column(
            children: [
              Spacer(),
              SelelctPictureWidget(
                image: imageTemorary,
                callback: () {
                  PickImage();
                },
              ),
              SizedBoxHeightWidget(height: 40),
              InputFieldProfilWidget(hintText: "Username", controller: name),
              SizedBoxHeightWidget(height: 40),
              CustomTextWidget(text: error, style: errorStyle),
              SizedBoxHeightWidget(height: 5),
              ButtonWidget(
                  isLoading: isLoading,
                  callback: () async {
                    if (name.text.length > 1) {
                      setState(() => isLoading = true);
                      final userData = await CreateUserImpl()
                          .createUser(name.text, imageTemorary);

                      userData.fold((l) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                            (route) => false);
                      }, (r) {
                        setState(() {
                          error = r.errorMessage!;
                        });
                      });

                      setState(() => isLoading = false);
                    }
                  },
                  text: "Save"),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
