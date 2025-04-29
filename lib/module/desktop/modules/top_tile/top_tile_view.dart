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
          SizedBox(width: 20),
          SizedBox(
            height: 40,
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    c.newHymn();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  label: Text("New Hymn"),
                  icon: Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    c.newHymn();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Colors.transparent,
                      side: BorderSide(width: 1, color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  label: Text("Favorites"),
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the current screen
                SystemNavigator.pop(); // Close the app
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  backgroundColor: Colors.transparent,
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
          Spacer(),
        ],
      ),
    );
  }
}
