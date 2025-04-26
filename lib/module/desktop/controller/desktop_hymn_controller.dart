import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sss_app/module/desktop/modules/main_bar/view/main_bar_view.dart';

class DesktopHymnController extends GetxController {
  RxList<Widget> views = <Widget>[MainBarView()].obs;
}
