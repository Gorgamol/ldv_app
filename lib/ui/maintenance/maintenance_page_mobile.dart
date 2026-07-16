import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';
import 'package:ldv_app/ui/widgets/work_in_progress_placeholder.dart';

class MaintenancePageMobile extends StatelessWidget {
  const MaintenancePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return LdvScaffoldMobile(
      title: context.translate.maintenance,
      onBack: () => context.pop(),
      content: const WorkInProgressPlaceholder(),
      bottomNavigationBar: const BottomNavigationBarMobile(),
    );
  }
}
