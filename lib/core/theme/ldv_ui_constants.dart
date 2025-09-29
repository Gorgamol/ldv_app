import 'package:flutter/material.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';

class LdvUiConstants {
  BoxDecoration get boxDecorationRounded {
    return BoxDecoration(
      color: _ldvColors.white,
      borderRadius: roundedBorderRadius,
      border: Border.all(width: 1.5),
      boxShadow: [
        BoxShadow(
          color: _ldvColors.black.withValues(alpha: 0.4),
          offset: const Offset(0, 4),
          spreadRadius: 0,
          blurRadius: 10,
        ),
      ],
    );
  }

  BoxDecoration get boxDecorationCircle {
    return BoxDecoration(
      color: _ldvColors.white,
      shape: BoxShape.circle,
      border: Border.all(width: 1.5),
      boxShadow: [
        BoxShadow(
          color: _ldvColors.black.withValues(alpha: 0.4),
          offset: const Offset(0, 4),
          spreadRadius: 0,
          blurRadius: 10,
        ),
      ],
    );
  }

  BorderRadius get roundedBorderRadius {
    return BorderRadius.circular(12);
  }

  LdvColors get _ldvColors {
    return LdvColors();
  }
}
