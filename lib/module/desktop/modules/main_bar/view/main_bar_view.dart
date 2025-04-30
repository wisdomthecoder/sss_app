import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBarView extends StatelessWidget {
  const MainBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
          )
        ],
      ),
    );
  }
}
