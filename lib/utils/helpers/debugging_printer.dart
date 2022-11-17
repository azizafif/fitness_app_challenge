import 'dart:developer';

class Print {
  static String prefix = '===';

  ///------------------------------------
  /// Print to console in black
  ///------------------------------------
  static void black(text) => log('\x1B[30m$text\x1B[0m', name: '   INTERNET'.padRight(12));

  ///------------------------------------
  /// Print to console in red
  ///------------------------------------
  static void red(text) => log('\x1B[31m$text\x1B[0m', name: '   Failure'.padRight(12));

  ///------------------------------------
  /// Print to console in green
  ///------------------------------------
  static void green(text) => log('\x1B[32m$text\x1B[0m', name: '   Success'.padRight(12));

  ///------------------------------------
  /// Print to console in yellow
  ///------------------------------------
  static void yellow(text) => log('\x1B[33m$text\x1B[0m', name: '   Request'.padRight(12));

  ///------------------------------------
  /// Print to console in blue
  ///------------------------------------
  static void blue(text) => log('\x1B[34m$text\x1B[0m', name: '   Service'.padRight(12));

  ///------------------------------------
  /// Print to console in magenta
  ///------------------------------------
  static void magenta(text) => log('\x1B[35m$text\x1B[0m', name: '   Session'.padRight(12));

  ///------------------------------------
  /// Print to console in cyan
  ///------------------------------------
  static void cyan(text) => log('\x1B[36m$text\x1B[0m', name: '   Token'.padRight(12));

  ///------------------------------------
  /// Print to console in white
  ///------------------------------------
  static void white(text) => log('\x1B[37m$text\x1B[0m', name: '   RETIRAL'.padRight(12));
}
