import 'package:flutter/material.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

class WorkInProgressPlaceholder extends StatelessWidget {
  const WorkInProgressPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        spacing: context.ldvUiConstants.mobileSpacing,
        children: const [
          Icon(Icons.construction_outlined, size: 45),
          Text(
            'An diesem Bereich wird noch gearbeitet! :)',
            style: TextStyle(fontWeight: .bold),
          ),
        ],
      ),
    );
  }
}
