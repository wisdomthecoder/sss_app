import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/data/shared_pref.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/modules/side_bar/controller/side_bar_controller.dart';
import 'package:sss_app/module/desktop/modules/top_tile/controller/top_tile_controller.dart';
import 'package:sss_app/module/desktop/modules/top_tile/views/new_hymn/hymn_input.dart';

import 'new_hymn/slides.dart';

class NewHymnDialogView extends StatelessWidget {
  const NewHymnDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    TopTileController c = Get.find<TopTileController>();

    return AlertDialog(
      titlePadding: EdgeInsets.all(5),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New Hymn",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.close),
            constraints: BoxConstraints(),
            padding: EdgeInsets.all(5),
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white38,
      contentPadding: EdgeInsets.all(0),
      content: SizedBox(
        width: width(context) * .6,
        height: height(context) * .7,
        child: Row(
          children: [
            Expanded(child: HymnInput()),
            Expanded(
              child: Slides(),
            )
          ],
        ),
      ),
      actionsPadding: EdgeInsets.all(5),
      actions: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40),
              backgroundColor: Get.theme.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(5))),
          child: Text("Cancel"),
        ),
        // SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Get.back();
            AppStorage.saveNewHymn(jsonEncode(
                Hymn(title: c.hymnTitle.text, hymn: c.hymnBody.text, id: 0)
                    .toJson()));
            Get.find<SideBarController>().getIndex();
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40),
              foregroundColor: Get.theme.primaryColor,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Get.theme.primaryColor),
                  borderRadius: BorderRadius.circular(5))),
          child: Text("Save"),
        ),
      ],
    );
    ;
  }
}
