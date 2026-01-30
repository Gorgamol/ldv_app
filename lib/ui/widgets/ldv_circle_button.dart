import 'package:flutter/material.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

class LdvCircleButton extends StatelessWidget {
  const LdvCircleButton({
    super.key,
    this.onTap,
    this.child,
    this.decorationImage,
  });

  final VoidCallback? onTap;
  final Widget? child;
  final DecorationImage? decorationImage;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Ink(
        height: 40,
        width: 40,
        decoration: context.ldvUiConstants.boxDecorationCircle.copyWith(
          image: decorationImage,
          boxShadow: null,
        ),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: child,
        ),
      ),
    );
  }
}
