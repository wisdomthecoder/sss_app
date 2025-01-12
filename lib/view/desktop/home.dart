import 'package:flutter/material.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/view/desktop/widgets/footer.dart';
import 'package:sss_app/view/desktop/widgets/side_panel.dart';
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
      windowManager.setTitleBarStyle(TitleBarStyle.normal);
    });
    super.initState();
  }

  bool isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.teal,
            Colors.teal.shade50,
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: isFullScreen ? 0 : 100,
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: Colors.white,
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
