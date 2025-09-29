import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';
import 'package:ldv_app/ui/widgets/ldv_progress_bar.dart';

class SplashPageDesktop extends ConsumerStatefulWidget {
  const SplashPageDesktop({super.key});

  @override
  ConsumerState<SplashPageDesktop> createState() => _SplashPageDesktopState();
}

class _SplashPageDesktopState extends ConsumerState<SplashPageDesktop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(_animationController);

    _progressAnimation.addListener(() {
      setState(() {});
      ref.read(clubBranchProvider.notifier).setBranch(branch: ClubBranch.mill);

      if (_progressAnimation.isCompleted) {
        context.go('/tasks');
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.ldvColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            Text(
              context.translate.appTitle,
              style: context.ldvTextStyles.headlineBig,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.15,
              child: Image.asset('assets/images/logo_ldv.png'),
            ),
            LdvProgressBar(
              value: _progressAnimation.value / 100,
              width: MediaQuery.sizeOf(context).width * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
