import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ldv_app/core/l10n/app_localizations.dart';
import 'package:ldv_app/core/routing/ldv_app_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';

class LdvApp extends StatelessWidget {
  const LdvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LDV App',
      routerConfig: ldvAppRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // TODO: Add Locale('en') back in
      supportedLocales: const [Locale('de')],
      debugShowCheckedModeBanner: false,
      theme: context.ldvTheme.themeData,
    );
  }
}
