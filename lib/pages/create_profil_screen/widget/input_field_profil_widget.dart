import 'package:flutter/material.dart';

class InputFieldProfilWidget extends StatelessWidget {
  const InputFieldProfilWidget(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
        validator: (value) {
          if (value != null && value.length < 1) {
            return "Enter min. 1 characters";
          } else {
            return null;
          }
        },
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
      ),
    );
  }
}
