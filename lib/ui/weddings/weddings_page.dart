import 'package:flutter/material.dart';
import 'package:ldv_app/ui/weddings/weddings_page_desktop.dart';
import 'package:ldv_app/ui/weddings/weddings_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class WeddingsPage extends StatelessWidget {
  const WeddingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: WeddingsPageMobile(),
      desktop: WeddingsPageDesktop(),
    );
  }
}
