import 'package:flutter/material.dart';
import 'package:ldv_app/ui/maintenance/maintenance_page_desktop.dart';
import 'package:ldv_app/ui/maintenance/maintenance_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: MaintenancePageMobile(),
      desktop: MaintenancePageDesktop(),
    );
  }
}
