import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';

class DashboardPageMobile extends StatelessWidget {
  const DashboardPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final branchCubit = context.read<BranchCubit>();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: _BlurredBackground(
        imagePath: 'assets/images/background_mill.jpg',
        child: Padding(
          padding: EdgeInsets.all(context.ldvUiConstants.mobileSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: context.ldvUiConstants.mobileSpacing,
            children: [
              Center(
                child: _DashboardButton(
                  imagePath: 'assets/images/logo_park.png',
                  onTap: () {
                    branchCubit.setBranch(branch: .park);
                    context.push(context.ldvRoutes.tasks);
                  },
                ),
              ),
              Center(
                child: _DashboardButton(
                  imagePath: 'assets/images/logo_mill.png',
                  onTap: () {
                    branchCubit.setBranch(branch: .mill);
                    context.push(context.ldvRoutes.tasks);
                  },
                ),
              ),
              Center(
                child: _DashboardButton(
                  imagePath: 'assets/images/logo_theater.png',
                  onTap: () {
                    branchCubit.setBranch(branch: .theater);
                    context.push(context.ldvRoutes.tasks);
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
  const _DashboardButton({required this.imagePath, required this.onTap});

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
          padding: EdgeInsets.all(context.ldvUiConstants.mobileSpacing),
          child: Image.asset(imagePath),
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
