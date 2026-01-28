import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';

class WeddingsPageMobile extends StatelessWidget {
  const WeddingsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return LdvScaffoldMobile(
      title: context.translate.weddings,
      onBack: () => context.go(context.ldvRoutes.dashboard),
      content: const Center(
        child: Text('An dieser View wird noch gearbeitet! :)'),
      ),
      bottomNavigationBar: const BottomNavigationBarMobile(),
    );
  }
}
