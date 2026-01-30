import 'package:flutter/material.dart';
import 'package:ldv_app/ui/tasks/task_overview_page_desktop.dart';
import 'package:ldv_app/ui/tasks/task_overview_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class TaskOverviewPage extends StatelessWidget {
  const TaskOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: TaskOverviewPageMobile(),
      desktop: TaskOverviewPageDesktop(),
    );
  }
}
