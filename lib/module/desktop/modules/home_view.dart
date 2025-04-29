import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/module/desktop/controller/desktop_hymn_controller.dart';
import 'package:sss_app/module/desktop/modules/main_bar/view/main_bar_view.dart';
import 'package:sss_app/module/desktop/modules/top_tile/top_tile_view.dart';
import 'package:sss_app/module/desktop/modules/widgets/footer.dart';
import 'package:sss_app/module/desktop/modules/side_bar/view/side_bar.dart';
import 'package:window_manager/window_manager.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      windowManager.maximize();
      windowManager.setResizable(false);
      windowManager.setTitleBarStyle(TitleBarStyle.normal);
    });
    super.initState();
  }

  bool isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    var c = Get.put(DesktopHymnController());
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.teal,
            Colors.greenAccent,
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: isFullScreen ? 0 : 100,
            width: double.infinity,
            child: TopTileView(),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: isFullScreen ? 0 : width(context) / 4,
                  child: SidePanel(),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                Expanded(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0.obs.value),
                                bottomLeft: Radius.circular(15)),
                            color: const Color.fromARGB(200, 255, 255, 255),
                          ),
                          padding: EdgeInsets.all(15),
                          child: c.views.last,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Footer(),
        ],
      ),
    ));
  }
}
