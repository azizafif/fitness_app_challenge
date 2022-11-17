import 'package:flutter/material.dart';

class AppValues {
  AppValues._();

  //? Scaffold
  static const double bodyTopPadding = 50;
  static const double bodyBottomPadding = 50;
  static const double bodyMinSymetricHorizontalPadding = 7;
  static const double bodyMaxSymetricHorizontalPadding = 32;

  //? Inputs
  static const double inputBorderWidth = 0.8;
  static const double inputBorderRadius = defaultRadius;
  static const int inputMaxLength = 50;
  static const int passwordInputMaxLength = 12;

  //$ Elevation concerned widgets
  static const bool _applyElevationToAppBar = defaultElevation != 0 && false;
  static const bool _applyElevationToElevatedButtons = defaultElevation != 0 && false;
  static const bool _applyElevationToInputs = defaultElevation != 0 && false;
  static const bool _applyElevationToBottomNavBar = defaultElevation != 0 && false;

  static bool get elevationAppliedToAppBar => _applyElevationToAppBar;

  //? AppBar
  static const double appBarHeight = 90 + defaultElevation;
  static const double appBarTopPaddingToSafeArea = 12;
  static const double searchAppBarHeight = 80;
  static const double appBarSymetricHorizontalPadding = bodyMaxSymetricHorizontalPadding;
  static const double appBarButtonsBorderRadius = 8;
  static const double appBarButtonHeight = 40 + defaultElevation;
  static const double appBarButtonIconSize = 20;
  static const double appBarButtonsElevation = _applyElevationToAppBar ? defaultElevation : 0;
  static const double appBarRadius = 28;
  static const double appBarElevation = _applyElevationToAppBar ? defaultElevation : 0;
  static const double searchAppBatTitleSpacing = 20;

  //? Bottom Navigation bar
  static BottomNavigationBarType bottomNavBarType = BottomNavigationBarType.fixed;
  static const double bottomNavBarHeight = 70;
  static const double bottomNavBarSelectedLabelFontSize = 10;
  static const double bottomNavBarUnselectedLabelFontSize = 10;
  static const double bottomNavBarRadius = 0;
  static const double bottomNavBarBlurRadius = 1;
  static const double bottomNavBarIconSize = 20;
  static const double bottomNavBarElevation = _applyElevationToBottomNavBar ? defaultElevation : 0;

  //? Floating Action Buttons
  static const double floatingActionButtonRadius = defaultRadius;
  static const double floatingActionButtonIconSize = 22;

  //? Text button
  static const double textButtonElevation = defaultElevation;
  static const double textButtonRadius = defaultRadius;
  static const double textButtonHeight = 52;

  //? Elevated button
  static const double elevatedButtonElevation = _applyElevationToElevatedButtons ? defaultElevation : 0;
  static const double elevatedButtonRadius = defaultRadius;
  static const double elevatedButtonHeight = 52;

  //? Link button
  static const double linkButtonHeight = 25;

  //? Inputs
  static const double textFieldElevation = _applyElevationToInputs ? defaultElevation : 0;
  static const double textFieldRadius = defaultRadius;
  static const double textFieldHeight = 43;
  static const double textFieldHorizontalContentPadding = 10;
  static const double textFieldMinVerticalContentPadding = 6;
  static const double textFieldMaxVerticalContentPadding = 12;
  static const double textFieldBorderWidth = dividerThickness;
  static const double searchWidgetHeight = 40;
  static const int inputsDefaultMaxLength = 50;
  static const double inputLeftContentPadding = 22;

  //? AutoComplete Inputs
  static const double autoCompleteInputSuggestionsBoxElevation = defaultElevation + 2;
  static const double autoCompleteInputSuggestionsSymetricHorizontalPadding = 10;
  static const double autoCompleteInputSuggestionsSymetricVerticalPadding = 5;
  static const int autoCompleteInputDebounceDuration = 600;

  //? Cards
  static const double cardElevation = defaultElevation;
  static const double cardRadius = defaultRadius;
  static const double cardIconSize = 36;

  //? list Tiles
  static const double listTileRadius = defaultRadius;

  //? Progress Indicators
  static const double circularProgressIndicatorStrokeWidth = 2;
  static const double linearProgressIndicatorMinHeight = 4;
  static const double downloadCircularProgressIndicatorColorSize = 45;

  //? Checkbox
  static const double checkboxRadius = defaultRadius > 0 ? 2 : 0;

  //? Dropdow
  static const double dropDownHeight = 55;
  static const double dropDownListItemHeight = 48;

  //? WebView
  static const double webViewElevation = defaultElevation + 2;

  //? Logo
  static const double logoSize = 75;

  //? Scaffold Divider
  static const double scaffoldDividerWidth = 130;
  static const double scaffoldDividerThickness = 2;
  static const double dividerThickness = .8;

  //? Page Control
  static const double pageControlDotSize = 8;

  //? Alert Buttons
  static const double alertButtonHeight = 42;

  //? File Picking
  static const int pickedFileSizeLimit = 5;
  static const int pickedFileSizeLimitInBytes = pickedFileSizeLimit * 1024 * 1024;
  static const int pickedImageQuality = 60;
  static const List<String> pickableFilesExtensions = ['jpeg', 'jpg', 'png', 'pdf'];

  //? Api Error Widget
  static const double apiErrorWidgetImageSize = 100;

  //$ Default Radius
  static const double defaultRadius = 14;

  //$ Elevation
  static const double defaultElevation = 1;
  //& UI assertions
  static void performUserInterfaceValuesAssertions() {
    assert(
      defaultElevation <= 3,
      '\n[defaultElevation] defaultElevation must be <= 3',
    );
    assert(
      defaultRadius <= 20,
      '\n[defaultElevation] defaultRadius must be <= 20',
    );
  }
}
