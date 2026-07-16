import 'package:flutter/material.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

class LdvRoundedButton extends StatelessWidget {
  const LdvRoundedButton({
    super.key,
    required this.onTap,
    required this.child,
    this.height = double.infinity,
    this.width = double.infinity,
    this.color = Colors.white,
    this.borderRadius,
  });

  final VoidCallback onTap;
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: width,
      decoration: context.ldvUiConstants.boxDecorationRounded().copyWith(
        color: color,
        borderRadius: borderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: context.ldvUiConstants.roundedBorderRadius,
        child: child,
      ),
    );
  }
}
