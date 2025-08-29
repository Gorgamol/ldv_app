import 'package:flutter/material.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

class LdvLoadingSpinner extends StatelessWidget {
  const LdvLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.ldvColors.white.withValues(alpha: 0.65),
        boxShadow: [
          BoxShadow(
            color: context.ldvColors.black.withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: CircularProgressIndicator(
        strokeWidth: 5,
        strokeCap: StrokeCap.round,
        color: context.ldvColors.bitterSweet,
        backgroundColor: context.ldvColors.white,
      ),
    );
  }
}
