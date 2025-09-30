import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';

class DashboardPageMobile extends StatelessWidget {
  const DashboardPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends ConsumerWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clubBranchNotifier = ref.read(clubBranchProvider.notifier);
    return Scaffold(
      body: _BlurredBackground(
        imagePath: 'assets/images/background_mill.jpg',
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Center(
                child: _DashboardButton(
                  title: context.translate.clubBranchPark,
                  imagePath: 'assets/images/logo_park.png',
                  onTap: () {
                    clubBranchNotifier.setBranch(branch: ClubBranch.park);
                    context.go(context.ldvRoutes.tasks);
                  },
                ),
              ),
              Center(
                child: _DashboardButton(
                  title: context.translate.clubBranchMill,
                  imagePath: 'assets/images/logo_mill.png',
                  onTap: () {
                    clubBranchNotifier.setBranch(branch: ClubBranch.mill);
                    context.go(context.ldvRoutes.tasks);
                  },
                ),
              ),
              Center(
                child: _DashboardButton(
                  title: context.translate.clubBranchTheater,
                  imagePath: 'assets/images/logo_theater.png',
                  onTap: () {
                    clubBranchNotifier.setBranch(branch: ClubBranch.theater);
                    context.go(context.ldvRoutes.tasks);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardButton extends StatelessWidget {
  const _DashboardButton({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = MediaQuery.sizeOf(context).height * 0.25;

    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: context.ldvUiConstants.roundedBorderRadius,
      child: LdvRoundedButton(
        height: buttonHeight,
        width: double.infinity,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Expanded(child: Image.asset(imagePath)),
              Text(
                title,
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
    );
  }
}

class _BlurredBackground extends StatelessWidget {
  const _BlurredBackground({required this.imagePath, required this.child});

  final String imagePath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: child,
      ),
    );
  }
}
