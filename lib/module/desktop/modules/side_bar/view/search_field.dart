import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/module/desktop/modules/side_bar/controller/side_bar_controller.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.find<SideBarController>();
    return TextField(
      controller: c.searchController,
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
      onChanged: (_) {
        // var v = c.searchController.text;
      },
    );
  }
}
