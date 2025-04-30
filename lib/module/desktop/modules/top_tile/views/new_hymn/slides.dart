import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/module/desktop/modules/top_tile/controller/top_tile_controller.dart';

class Slides extends StatelessWidget {
  const Slides({super.key});

  @override
  Widget build(BuildContext context) {
    TopTileController c = Get.find<TopTileController>();

    return Obx(
      () => Container(
        child: ListView(
          children: [
            ...c.body.value.split("\n\n").map((e) => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.teal,
                            Colors.teal.shade900,
                          ])),
                  width: width(context) * .3,
                  height: (width(context) * .3) * 4 / 5,
                  padding: EdgeInsets.all(30),
                  child: FittedBox(
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
