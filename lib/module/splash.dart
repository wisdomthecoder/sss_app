import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/module/desktop/modules/home_view.dart';
import 'package:sss_app/module/desktop/modules/side_bar/controller/side_bar_controller.dart';
import 'package:window_manager/window_manager.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    windowManager.setAlignment(Alignment.center);
    windowManager.setSize(Size(300, 300));

    Timer(Duration(seconds: 3), () {
      Get.offAll(DesktopHome());
    });
    //Process Code before Viewing
    var c = Get.put(SideBarController());

    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(tag: 'splash', child: FlutterLogo(size: 100)),
            CupertinoActivityIndicator(
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
