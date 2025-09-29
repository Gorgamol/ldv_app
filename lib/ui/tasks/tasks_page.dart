import 'package:flutter/material.dart';
import 'package:ldv_app/ui/tasks/tasks_page_desktop.dart';
import 'package:ldv_app/ui/tasks/tasks_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      mobile: TasksPageMobile(),
      desktop: TasksPageDesktop(),
    );
  }
}
