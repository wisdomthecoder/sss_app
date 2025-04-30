import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/module/desktop/modules/top_tile/views/new_hymn_dialog_view.dart';

class TopTileController extends GetxController {
  newHymn() {
    showDialog(
        context: Get.context!,
        builder: (c) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child:
                SizedBox(width: 200, height: 500, child: NewHymnDialogView()),
          );
        });
  }

  TextEditingController hymnTitle =
      TextEditingController(text: "Test ${DateTime.now()}");
  RxString body = "".obs;
  TextEditingController hymnBody = TextEditingController(text: """
Wisdom the Coder
Wisdom dauda
Amazing Programmer
This is a full COder

Programmer is Coder
Wisdom Programmer 
Jesus is Lord
Amazing King Coder

Wisdom the Coder
Wisdom dauda
Amazing Programmer
This is a full COder

Programmer is Coder
Wisdom Programmer 
Jesus is Lord
Amazing King Coder

Wisdom the Coder
Wisdom dauda
Amazing Programmer
This is a full COder

Programmer is Coder
Wisdom Programmer 
Jesus is Lord
Amazing King Coder
""");
}
