import 'package:chat_app/shared/screen_adaption.dart';
import 'package:flutter/material.dart';

class SelelctPictureWidget extends StatelessWidget {
  const SelelctPictureWidget({Key? key, required this.callback})
      : super(key: key);
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50 * sH(context),
            backgroundColor: Colors.transparent,
            child: Image.asset("assets/img/avatar.png"),
          ),
          Positioned(
              right: -10 * sW(context),
              bottom: -10 * sW(context),
              child:
                  IconButton(onPressed: callback, icon: Icon(Icons.add_circle)))
        ],
      ),
    );
  }
}
