import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/modules/side_bar/controller/side_bar_controller.dart';
import 'package:sss_app/module/desktop/modules/side_bar/view/hymn_tile.dart';
import 'package:sss_app/module/desktop/modules/side_bar/view/search_field.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(SideBarController());
    return Column(
      spacing: 10,
      children: [
        SearchTextField(),
        Obx(() {
          // This is going to be the list for the hymns, from default to user save to custom hymns
          if (c.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Expanded(
                child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) => HymnTile(Hymn(
                  id: int.parse(c.filteredIndices[index].id.trim()),
                  hymn: c.filteredIndices[index].hymn ??
                      'assets/songs/h${c.filteredIndices[index].id}.hnf',
                  title: c.filteredIndices[index].title)),
              itemCount: c.filteredIndices.length,
            ));
          }
        })
      ],
    );
  }
}
