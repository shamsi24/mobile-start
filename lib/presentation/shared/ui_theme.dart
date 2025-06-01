import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rht_mobile_template/presentation/shared/shared.dart';

abstract class UITheme {
  static get appTheme {
    return ThemeData(
      useMaterial3: true,
      splashFactory: InkSplash.splashFactory,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: UIColor.primary,
        selectionColor: UIColor.blue,
        selectionHandleColor: UIColor.primary,
      ),
      colorScheme: const ColorScheme.light(
        primary: UIColor.primary,
        secondary: UIColor.primary,
        onPrimary: UIColor.white,
        onSecondary: UIColor.primary,
      ),
      scaffoldBackgroundColor: UIColor.background,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        surfaceTintColor: UIColor.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: UIColor.black,
        ),
        iconTheme: const IconThemeData(
          color: UIColor.black,
        ),
        backgroundColor: UIColor.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: UIColor.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: GoogleFonts.poppins(),
          tabLabelTextStyle: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
