import 'package:flutter/material.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';

enum TaskStatus {
  open,
  discarded,
  finished,
  unknown;

  @override
  String toString() {
    return switch (this) {
      open => 'open',
      discarded => 'discarded',
      finished => 'finished',
      _ => 'unknown',
    };
  }

  String toStringTranslated() {
    return switch (this) {
      open => 'Offen',
      discarded => 'Verworfen',
      finished => 'Erledigt',
      _ => 'Unbekannt',
    };
  }

  Color toColor() {
    return switch (this) {
      open => LdvColors().white,
      discarded => LdvColors().dustyGray,
      finished => LdvColors().bermudaLight,
      _ => Colors.transparent,
    };
  }

  Widget toIcon() {
    return switch (this) {
      discarded => const Icon(Icons.delete_outline),
      finished => const Icon(Icons.check_circle_outline),
      _ => Icon(Icons.circle_outlined),
    };
  }

  static TaskStatus fromString({required String value}) {
    return switch (value) {
      'open' => open,
      'discarded' => discarded,
      'finished' => finished,
      _ => unknown,
    };
  }
}
