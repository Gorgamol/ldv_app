import 'package:flutter/material.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

class LdvProgressBar extends StatelessWidget {
  const LdvProgressBar({
    super.key,
    required this.value,
    this.width = double.infinity,
  });

  final double value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.ldvColors.black.withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      width: width,
      child: LinearProgressIndicator(
        value: value,
        minHeight: 10,
        color: context.ldvColors.bitterSweet,
        backgroundColor: context.ldvColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
