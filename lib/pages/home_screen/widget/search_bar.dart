import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFF7F7FC),
        enabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
