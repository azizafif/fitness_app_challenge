import 'dart:io';

import 'package:path_provider/path_provider.dart';

class AppResources {
  AppResources._();

  static const String fontsFolder = 'assets/fonts/';
  static const String mocksFolder = 'assets/mock/';
  static const String imagesFolder = 'assets/images/';

  static Future<String> storageFolderPerPlatfrom() async =>
      Platform.isIOS ? (await getApplicationDocumentsDirectory()).path : '/storage/emulated/0/Download';
}
