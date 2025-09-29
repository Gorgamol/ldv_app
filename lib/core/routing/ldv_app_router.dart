import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/ui/maintenance/maintenance_page.dart';
import 'package:ldv_app/ui/splash/splash_page.dart';
import 'package:ldv_app/ui/tasks/tasks_page.dart';

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
      path: '/tasks',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: TasksPage());
      },
    ),
    GoRoute(
      path: '/maintenance',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: MaintenancePage());
      },
    ),
  ],
);
