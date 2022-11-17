import 'package:fitness_exercises_challenge/app/app_widget.dart';
import 'package:fitness_exercises_challenge/app/environment/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _setupStatusBarTransparency();

  _setupAllowedDeviceOrientations();

  _setupEasyLoading();

  _setupEnvironment(Environment.dev);

  runApp(MyApp());
}

void _setupEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = const Color.fromARGB(255, 12, 13, 12)
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

void _setupStatusBarTransparency() => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      systemNavigationBarColor: Colors.green,
    ));

void _setupAllowedDeviceOrientations() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

void _setupEnvironment(Environment environment) => AppEnvironment.current = environment;
