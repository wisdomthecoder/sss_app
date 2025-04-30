import 'package:flutter/material.dart';
import 'package:sss_app/config/theme/my_theme.dart';

extension ColorUtil on Color {
  Color get darken => darkenColor(this);
  Color get darken1 => darkenColor(this, 0.1);
  Color get darken2 => darkenColor(this, 0.2);
  Color get darken3 => darkenColor(this, 0.3);
  Color get darken4 => darkenColor(this, 0.4);
  Color get darken5 => darkenColor(this, 0.5);
  Color get brighten => brigthenColor(this);
  Color get brighten1 => brigthenColor(this, 0.1);
  Color get brighten2 => brigthenColor(this, 0.2);
  Color get brighten3 => brigthenColor(this, 0.3);
  Color get brighten4 => brigthenColor(this, 0.4);
  Color get brighten5 => brigthenColor(this, 0.5);
  Color get brighten6 => brigthenColor(this, 0.6);
  Color get brighten7 => brigthenColor(this, 0.7);
  Color get brighten8 => brigthenColor(this, 0.8);
  Color get brighten9 => brigthenColor(this, 0.9);
}
