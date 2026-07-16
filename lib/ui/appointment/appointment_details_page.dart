import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/features/appointment/domain/models/appointment.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';
import 'package:ldv_app/ui/widgets/work_in_progress_placeholder.dart';

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key, required this.appointment});

  final Appointment? appointment;

  @override
  Widget build(BuildContext context) {
    return LdvScaffoldMobile(
      title: appointment != null ? 'Termin Details' : 'Termin erstellen',
      showBranchText: false,
      onBack: () => context.pop(),
      content: const WorkInProgressPlaceholder(),
    );
  }
}
