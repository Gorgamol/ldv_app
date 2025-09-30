import 'package:flutter/material.dart';
import 'package:ldv_app/ui/dashboard/dashboard_page_desktop.dart';
import 'package:ldv_app/ui/dashboard/dashboard_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: DashboardPageMobile(),
      desktop: DashboardPageDesktop(),
    );
  }
}
