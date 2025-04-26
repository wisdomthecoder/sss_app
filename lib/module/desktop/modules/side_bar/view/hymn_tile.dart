import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/module/desktop/controller/desktop_hymn_controller.dart';
import 'package:sss_app/module/desktop/modules/main_bar/view/hymn_view.dart';

class HymnTile extends StatelessWidget {
  const HymnTile(this.hymn, {super.key});
  final Hymn hymn;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white30,
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
        trailing: Icon(Icons.favorite_outline),
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
