import 'package:flutter/material.dart';
import 'package:ldv_app/ui/appointment/appointments_overview_page_desktop.dart';
import 'package:ldv_app/ui/appointment/appointments_overview_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class AppointmentsOverviewPage extends StatelessWidget {
  const AppointmentsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: AppointmentsOverviewPageMobile(),
      desktop: AppointmentsOverviewPageDesktop(),
    );
  }
}
