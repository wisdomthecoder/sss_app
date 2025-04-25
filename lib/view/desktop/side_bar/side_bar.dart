import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sss_app/model/hymn.dart';
import 'package:sss_app/view/desktop/widgets/hymn_tile.dart';
import 'package:sss_app/view/widgets/textfield.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Column(
          spacing: 10,
          children: [
            SearchTextField(),
            Expanded(
                child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) => HymnTile(Hymn(
                  hymnNum: index,
                  hymn: "To God be the Glory",
                  title: 'To God be the Glory')),
              itemCount: 1200,
            ))
          ],
        ),
      ),
    );
  }
}
