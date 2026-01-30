import 'package:flutter/material.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';

enum TaskPriority {
  low,
  normal,
  high,
  unknown;

  @override
  String toString() {
    return switch (this) {
      low => 'low',
      normal => 'normal',
      high => 'high',
      _ => 'unknown',
    };
  }

  String toStringTranslated() {
    return switch (this) {
      low => 'Niedrig',
      normal => 'Normal',
      high => 'Hoch',
      _ => 'Unbekannt',
    };
  }

  Color toColor() {
    return switch (this) {
      high => LdvColors().bitterSweetLight,
      normal => LdvColors().white,
      low => LdvColors().dustyGrayLight,
      _ => Colors.transparent,
    };
  }

  Widget toIcon() {
    return switch (this) {
      high => const Icon(Icons.keyboard_double_arrow_up),
      low => const Icon(Icons.keyboard_double_arrow_down),
      _ => const Icon(Icons.horizontal_rule),
    };
  }

  static TaskPriority fromString({required String value}) {
    return switch (value) {
      'low' => low,
      'normal' => normal,
      'high' => high,
      _ => unknown,
    };
  }
}
