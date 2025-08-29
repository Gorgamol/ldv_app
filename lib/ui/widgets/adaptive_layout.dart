import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  final Widget mobile;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (_isMobile) {
      return mobile;
    }

    if (_isDesktop) {
      return desktop;
    }

    return const Placeholder();
  }

  bool get _isMobile => Platform.isAndroid || Platform.isIOS;

  bool get _isDesktop => Platform.isWindows || kIsWeb;
}
