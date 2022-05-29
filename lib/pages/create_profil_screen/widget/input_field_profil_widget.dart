import 'package:flutter/material.dart';

class InputFieldProfilWidget extends StatelessWidget {
  const InputFieldProfilWidget({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF7F7FC),
        enabledBorder: InputBorder.none,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        hintText: hintText,
      ),
    );
  }
}
