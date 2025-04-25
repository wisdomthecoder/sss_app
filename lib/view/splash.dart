import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/view/desktop/home.dart';
import 'package:window_manager/window_manager.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // windowManager.setSize(Size(300, 300));

    Timer(Duration(seconds: 3), () {
      Get.offAll(DesktopHome());
    });
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
