import 'package:flutter/material.dart';
import 'package:ldv_app/ui/splash/splash_page_desktop.dart';
import 'package:ldv_app/ui/splash/splash_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: SplashPageMobile(),
      desktop: SplashPageDesktop(),
    );
  }
}
