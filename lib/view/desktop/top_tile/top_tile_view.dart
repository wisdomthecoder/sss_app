import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TopTileView extends StatelessWidget {
  const TopTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Positioned(
          top: 0,
          left: 0,
          child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the current screen
                SystemNavigator.pop(); // Close the app
              },
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
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
    );
  }
}
