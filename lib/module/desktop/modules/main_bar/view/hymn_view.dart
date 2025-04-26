import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/controller/desktop_hymn_controller.dart';
import 'package:sss_app/module/desktop/modules/side_bar/model/index.dart';

class HymnView extends StatelessWidget {
  const HymnView(this.hymn, {super.key});
  final Hymn hymn;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.white10,
            child: Row(
              spacing: 10,
              children: [
                IconButton(
                    onPressed: () {
                      Get.find<DesktopHymnController>().views.removeLast();
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  hymn.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SelectableText(
            hymn.hymn,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
