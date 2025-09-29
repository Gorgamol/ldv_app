import 'package:flutter/material.dart';
import 'package:ldv_app/core/l10n/app_localizations.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';
import 'package:ldv_app/core/theme/ldv_text_styles.dart';
import 'package:ldv_app/core/theme/ldv_theme.dart';
import 'package:ldv_app/core/theme/ldv_ui_constants.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
  LdvColors get ldvColors => LdvColors();
  LdvTextStyles get ldvTextStyles => LdvTextStyles();
  LdvUiConstants get ldvUiConstants => LdvUiConstants();
  LdvTheme get ldvTheme => LdvTheme();
}
