import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/module/desktop/modules/top_tile/controller/top_tile_controller.dart';

class HymnInput extends StatelessWidget {
  const HymnInput({super.key});

  @override
  Widget build(BuildContext context) {
    TopTileController c = Get.find<TopTileController>();
    c.body.value = c.hymnBody.text;

    return Container(
      // color: Colors.white54,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TextField(
            controller: c.hymnTitle,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Title"),
          ),
          SizedBox(height: 15),
          Row(
            spacing: 5,
            children: [
              Text(
                "Body",
                style: TextStyle(fontSize: 12),
              ),
              Expanded(
                  child: Divider(
                color: Colors.black45,
              )),
            ],
          ),
          Expanded(
            child: TextField(
              controller: c.hymnBody,
              maxLines: null,
              expands: true,
              onChanged: (v) {
                c.body.value = v;
              },
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            spacing: 5,
            children: [
              Text(
                "Composer or Artist or Author(Optional)",
                style: TextStyle(fontSize: 12),
              ),
              Expanded(
                  child: Divider(
                color: Colors.black45,
              )),
            ],
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Title"),
          ),
        ],
      ),
    );
  }
}
