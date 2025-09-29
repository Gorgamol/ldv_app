import 'package:flutter/material.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';

class LdvTheme {
  ThemeData get themeData {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _ldvColors.bitterSweet,
      ),
    );
  }

  LdvColors get _ldvColors {
    return LdvColors();
  }
}
