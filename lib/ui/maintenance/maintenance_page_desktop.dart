import 'package:flutter/material.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_desktop.dart';

class MaintenancePageDesktop extends StatelessWidget {
  const MaintenancePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const LdvScaffoldDesktop(
      title: 'Wartungsbuch',
      content: Placeholder(),
    );
  }
}
