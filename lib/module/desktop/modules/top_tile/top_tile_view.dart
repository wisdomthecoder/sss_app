import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sss_app/config/theme/my_theme.dart';
import 'package:sss_app/data/shared_pref.dart';
import 'package:sss_app/module/desktop/modules/side_bar/controller/side_bar_controller.dart';
import 'package:sss_app/module/desktop/modules/top_tile/controller/top_tile_controller.dart';

class TopTileView extends StatelessWidget {
  const TopTileView({super.key});

  @override
  Widget build(BuildContext context) {
    TopTileController c = Get.put(TopTileController());
    RxBool isFav = Get.find<SideBarController>()
        .filteredIndices
        .every((e) =>
            AppStorage.getFavorites().contains(e.id.toString() + e.title))
        .obs;
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
                Obx(
                  () {
                    var isFavv = Get.find<SideBarController>()
                        .filteredIndices
                        .every((e) => AppStorage.getFavorites()
                            .contains(e.id.toString() + e.title));
                    return ElevatedButton.icon(
                      onPressed: () {
                        isFavv
                            ? Get.find<SideBarController>().getIndex()
                            : Get.find<SideBarController>().getIndex(true);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor:
                              isFavv ? Colors.red.shade800 : Colors.transparent,
                          side: BorderSide(
                            width: 1,
                            color: isFavv ? Colors.red.shade800 : Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      label: Text("Favorites"),
                      icon: Icon(Icons.favorite),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {
                      MyTheme.changeTheme();
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Get.theme.primaryColorDark,
                        backgroundColor: Get.theme.scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    icon: Icon(Icons.nightlight))
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
