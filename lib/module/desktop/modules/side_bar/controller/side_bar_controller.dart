import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sss_app/data/shared_pref.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/modules/side_bar/model/index.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

class SideBarController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getIndex();
    searchController.addListener(() {
      filteredIndices.value = [
        ...indices.where((e) => ('${e.id} ${e.title} ${e.hymn}'
            .toLowerCase()
            .contains(searchController.text.trim().toLowerCase())))
      ];
    });
  }

  ///[GETTING INDEXS]
  RxList<Index> indices = <Index>[].obs;

  RxList<Index> filteredIndices = <Index>[].obs;
  RxBool isLoading = true.obs;

  getIndex() async {
    isLoading.value = true;
    List<Hymn> localHymnIndex = <Hymn>[
      ...AppStorage.getBookmarks().map((e) => Hymn.fromJson(jsonDecode(e)))
    ];
    try {
      await rootBundle.rootBundle
          .loadString("assets/data/index.json")
          .then((e) {
        var data = defaultIndexFromJson(e);
        List<Index>;
        indices.value = [
          ...localHymnIndex.map((e) =>
              Index(id: e.id?.toString() ?? "0", hymn: e.hymn, title: e.title)),
          ...data.indices
        ];
        filteredIndices.value = indices;
        isLoading.value = false;
      });
    } catch (e) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text(e.toString()),
      ));
    }
  }

  //
  //
  //
  //
  ///[search]
  var searchController = TextEditingController();
}
