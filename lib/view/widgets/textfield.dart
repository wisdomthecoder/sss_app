import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(13),
        ),
        enabled: true,
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.white,
        ),
        hintText: "Search Hymn or Enter Number",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(92, 255, 255, 255)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
