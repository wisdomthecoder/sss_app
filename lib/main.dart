import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:flutter_acrylic/window_effect.dart';
import 'package:get/get.dart';
import 'package:sss_app/config/utils.dart';
import 'package:sss_app/data/shared_pref.dart';
import 'package:sss_app/module/splash.dart';
import 'package:window_manager/window_manager.dart';

const String appTitle = 'Win UI for Flutter';

/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  await AppStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  // if it's not on the web, windows or android, load the accent color
  if (!kIsWeb &&
      [
        TargetPlatform.android,
        TargetPlatform.windows,
      ].contains(defaultTargetPlatform)) {}

  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();
    await flutter_acrylic.Window.initialize();
    if (defaultTargetPlatform == TargetPlatform.windows) {
      await flutter_acrylic.Window.setEffect(effect: WindowEffect.transparent);
    }
    // await windowManager.setSize(Size(300, 300));
    await windowManager.setAlignment(Alignment.center);

    await windowManager.focus();
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden,
        windowButtonVisibility: true);
    await windowManager.setMinimizable(false);

    await windowManager.setTitle("Sacred Song of Solos");
  }

  runApp(const MyApp());

  Future.wait([]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        dividerColor: Colors.black12,
        useMaterial3: true,
        fontFamily: "SFUIDisplay",
      ),
    );
  }
}
