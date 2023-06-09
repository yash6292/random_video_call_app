import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_video_call_app/utils/font_style.dart';
import 'material_color.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: MaterialAppColor.primaryColor),
      scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
      fontFamily: 'Josefin Sans',
      primarySwatch: MaterialAppColor.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor:  Colors.white,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          centerTitle: true,
          titleTextStyle: FontStyleUtilities.h3(fontWeight: FWT.medium)));
}
