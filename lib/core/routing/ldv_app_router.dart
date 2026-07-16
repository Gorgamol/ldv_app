import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/features/appointment/domain/models/appointment.dart';
import 'package:ldv_app/ui/appointment/appointment_details_page.dart';
import 'package:ldv_app/ui/dashboard/dashboard_page.dart';
import 'package:ldv_app/ui/maintenance/overview/maintenance_overview_page.dart';
import 'package:ldv_app/ui/splash/splash_page.dart';
import 'package:ldv_app/ui/tasks/task_details_page.dart';
import 'package:ldv_app/ui/tasks/task_overview_page.dart';
import 'package:ldv_app/ui/appointment/appointments_overview_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final ldvAppRouter = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SplashPage());
      },
    ),
    GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) {
        return const NoTransitionPage(
          child: PopScope(canPop: false, child: DashboardPage()),
        );
      },
    ),
    GoRoute(
      path: '/tasks',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: TaskOverviewPage());
      },
    ),
    GoRoute(
      path: '/tasks/details',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          child: TaskDetailsPage(taskId: state.extra as String?),
        );
      },
    ),
    GoRoute(
      path: '/maintenance',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: MaintenanceOverviewPage());
      },
    ),
    GoRoute(
      path: '/appointments',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: AppointmentsOverviewPage());
      },
    ),
    GoRoute(
      path: '/appointments/details',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          child: AppointmentDetailsPage(
            appointment: state.extra as Appointment?,
          ),
        );
      },
    ),
  ],
);
