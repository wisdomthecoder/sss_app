import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(style: TextStyle(fontSize: 18), children: [
          TextSpan(
              text: "Wisdom Dauda",
              style: TextStyle(fontWeight: FontWeight.w500)),
          TextSpan(
              text: "(@wisdomthecoder)",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
