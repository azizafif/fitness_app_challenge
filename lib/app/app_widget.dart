import 'dart:async';

import 'package:fitness_exercises_challenge/app/design/app_images.dart';
import 'package:fitness_exercises_challenge/shared/handlers/connectivity_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../modules/home/module/home_module.dart';
import 'design/index.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    ConnectivityHandler.startMonitoring();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.precacheAssets(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            //$ Theme management
            theme: AppThemes.lightTheme,

            builder: EasyLoading.init(),

            //@ Routing
            initialRoute: homeModule.name,
            getPages: [homeModule],
            defaultTransition: Transition.cupertino,
          );
        },
      );
}
