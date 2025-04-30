import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/controller/desktop_hymn_controller.dart';
import 'package:sss_app/module/desktop/modules/side_bar/model/index.dart';

class HymnView extends StatelessWidget {
  const HymnView(this.hymn, {this.path, super.key});
  final Hymn hymn;
  final String? path;

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
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
                ),
                IconButton(
                    onPressed: () {
                      Process.run('cmd',
                          ['/c', 'start', 'assets/songs/tune/a0002.mp3']);
                    },
                    icon: Icon(Icons.play_arrow))
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(children: [
                  if (!hymn.hymn.contains('assets/songs/'))
                    SelectableText(
                      hymn.hymn,
                      style: TextStyle(fontSize: 16),
                    )
                  else
                    FutureBuilder(
                        future: rootBundle.loadString(hymn.hymn),
                        builder: (c, r) {
                          return SelectableText(
                            r.data ?? '',
                            style: TextStyle(fontSize: 16),
                          );
                        })
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
