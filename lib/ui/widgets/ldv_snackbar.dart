import 'package:flutter/material.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

enum SnackBarType { success, error }

void showLdvSnackbar({
  required BuildContext context,
  required String message,
  SnackBarType type = SnackBarType.success,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();

  ScaffoldMessenger.of(
    context,
  ).showSnackBar(_snackBar(context: context, message: message, type: type));
}

SnackBar _snackBar({
  required BuildContext context,
  required String message,
  required SnackBarType type,
}) => SnackBar(
  content: ConstrainedBox(
    constraints: const BoxConstraints(minHeight: 32),
    child: Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
    ),
  ),
  backgroundColor: switch (type) {
    SnackBarType.success => context.ldvColors.bermuda,
    SnackBarType.error => context.ldvColors.bitterSweet,
  },
  elevation: 5,
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(context.ldvUiConstants.mobileSpacing),
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  shape: RoundedRectangleBorder(
    borderRadius: context.ldvUiConstants.roundedBorderRadius,
    side: const BorderSide(
      color: Colors.black,
      width: 1.5,
      strokeAlign: BorderSide.strokeAlignOutside,
    ),
  ),
  clipBehavior: Clip.none,
);
