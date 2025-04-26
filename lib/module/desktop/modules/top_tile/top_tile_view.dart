import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sss_app/module/desktop/modules/top_tile/controller/top_tile_controller.dart';

class TopTileView extends StatelessWidget {
  const TopTileView({super.key});

  @override
  Widget build(BuildContext context) {
    TopTileController c = Get.put(TopTileController());
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  c.newHymn();
                },
                child: Text("NEW Hymn")),
          ),
          Spacer(),
          Center(
            child: Positioned(
              top: 0,
              left: 0,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the current screen
                    SystemNavigator.pop(); // Close the app
                  },
                  style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5))),
                  child: Text(
                    "Exit",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
