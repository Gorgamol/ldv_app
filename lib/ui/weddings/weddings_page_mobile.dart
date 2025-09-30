import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';

class WeddingsPageMobile extends ConsumerWidget {
  const WeddingsPageMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branch = ref.watch(clubBranchProvider);

    return LdvScaffoldMobile(
      title: context.translate.weddings,
      onBack: () => context.go(context.ldvRoutes.dashboard),
      content: const Center(
        child: Text('An dieser View wird noch gearbeitet! :)'),
      ),
      bottomNavigationBar: switch (branch) {
        ClubBranch.park || ClubBranch.mill => const BottomNavigationBarMobile(),
        _ => null,
      },
    );
  }
}
