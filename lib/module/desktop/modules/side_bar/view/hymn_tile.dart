import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/config/theme/color_util.dart';
import 'package:sss_app/data/shared_pref.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/controller/desktop_hymn_controller.dart';
import 'package:sss_app/module/desktop/modules/main_bar/view/hymn_view.dart';
import 'package:sss_app/module/desktop/modules/side_bar/model/index.dart';

class HymnTile extends StatelessWidget {
  const HymnTile(this.hymn, {this.path, super.key});
  final Hymn hymn;
  final String? path;

  @override
  Widget build(BuildContext context) {
    RxList favorites = [].obs;
    favorites.value = AppStorage.getFavorites();
    var index = hymn.id.toString() + hymn.title;
    RxBool isAddedToFavorites = favorites.contains(index).obs;

    void updateFavorites() {
      favorites.value = AppStorage.getFavorites();
      isAddedToFavorites.value = favorites.contains(index);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Get.theme.colorScheme.onPrimary.withOpacity(.3),
      ),
      child: ListTile(
        minLeadingWidth: 20,
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.red,
          ),
        ),
        trailing: Obx(() {
          return IconButton(
            icon: Icon(
              isAddedToFavorites.value
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color:
                  isAddedToFavorites.value ? Get.theme.colorScheme.error : null,
            ),
            onPressed: () {
              AppStorage.addToFavorites(index);
              updateFavorites();
            },
          );
        }),
        leading: Text(
          hymn.id.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Get.find<DesktopHymnController>().views.add(HymnView(hymn));
        },
        title: Text(
          hymn.title,
        ),
      ),
    );
  }
}
