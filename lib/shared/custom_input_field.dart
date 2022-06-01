import 'package:flutter/material.dart';

class CustomInputFieldWidget extends StatelessWidget {
  const CustomInputFieldWidget(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
