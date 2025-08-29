import 'package:flutter/material.dart';
import 'package:ldv_app/core/routing/ldv_app_router.dart';

class LdvApp extends StatelessWidget {
  const LdvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LDV App',
      theme: ThemeData(),
      routerConfig: ldvAppRouter,
    );
  }
}
