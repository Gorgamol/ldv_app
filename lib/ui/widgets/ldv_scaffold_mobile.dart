import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';

class LdvScaffoldMobile extends StatelessWidget {
  const LdvScaffoldMobile({
    super.key,
    required this.title,
    required this.content,
    required this.onBack,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final String title;
  final Widget content;
  final VoidCallback onBack;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.ldvColors.white,
      body: Column(
        children: [
          ColoredBox(
            color: Colors.white,
            child: _Header(title: title, onBack: onBack),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: content,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branch = ref.watch(clubBranchProvider);
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Material(
                borderRadius: context.ldvUiConstants.roundedBorderRadius,
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  onTap: onBack,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.chevron_left),
                        Text(
                          '${branch.toString()} - $title',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            fontFamily: 'Salterio',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              switch (branch) {
                ClubBranch.park => Image.asset(
                  'assets/images/logo_park.png',
                  height: 42,
                ),
                ClubBranch.mill => Image.asset(
                  'assets/images/logo_mill.png',
                  height: 42,
                ),
                ClubBranch.theater => Image.asset(
                  'assets/images/logo_theater.png',
                  height: 42,
                ),
                _ => const SizedBox.shrink(),
              },
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
          height: 1.5,
          color: context.ldvColors.black,
          radius: context.ldvUiConstants.roundedBorderRadius,
        ),
      ],
    );
  }
}
