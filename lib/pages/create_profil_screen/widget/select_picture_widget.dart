import 'dart:io';

import 'package:chat_app/shared/screen_adaption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelelctPictureWidget extends StatelessWidget {
  const SelelctPictureWidget(
      {Key? key, required this.callback, required this.image})
      : super(key: key);
  final VoidCallback callback;
  final File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.transparent,
            backgroundImage: image != null
                ? FileImage(image!)
                : AssetImage("assets/img/avatar.png") as ImageProvider,
          ),
          Positioned(
              right: -10.w,
              bottom: -10.w,
              child:
                  IconButton(onPressed: callback, icon: Icon(Icons.add_circle)))
        ],
      ),
    );
  }
}
