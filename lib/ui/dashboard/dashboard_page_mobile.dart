import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/appointment/adapter/in/appointment_cubit.dart';
import 'package:ldv_app/features/appointment/adapter/in/appointment_state.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_snackbar.dart';

class DashboardPageMobile extends StatelessWidget {
  const DashboardPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<AppointmentCubit>()..loadAppointments();
      },
      child: BlocListener<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            showLdvSnackbar(
              context: context,
              message: state.error ?? '',
              type: .error,
            );
          }
        },
        child: const _DashboardView(),
      ),
    );
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
          padding: EdgeInsets.symmetric(
            horizontal: context.ldvUiConstants.mobileSpacing,
            vertical: context.ldvUiConstants.mobileSpacingBig,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
                const _DashboardSectionTitle(title: 'Mein Bereich'),
                SizedBox(height: context.ldvUiConstants.mobileSpacing),
                const _MySection(),
                SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
                const _DashboardSectionTitle(title: 'Anstehende Termine'),
                SizedBox(height: context.ldvUiConstants.mobileSpacing),
                const _AppointmentSection(),
                SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
                const _DashboardSectionTitle(title: 'Vereinssparten'),
                SizedBox(height: context.ldvUiConstants.mobileSpacing),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  mainAxisSpacing: context.ldvUiConstants.mobileSpacingSmall,
                  crossAxisSpacing: context.ldvUiConstants.mobileSpacingSmall,
                  children: [
                    _DashboardButton(
                      imagePath: 'assets/images/logo_park.png',
                      onTap: () {
                        branchCubit.setBranch(branch: .park);
                        context.push(context.ldvRoutes.tasks);
                      },
                    ),
                    _DashboardButton(
                      imagePath: 'assets/images/logo_mill.png',
                      onTap: () {
                        branchCubit.setBranch(branch: .mill);
                        context.push(context.ldvRoutes.tasks);
                      },
                    ),
                    _DashboardButton(
                      imagePath: 'assets/images/logo_theater.png',
                      onTap: () {
                        branchCubit.setBranch(branch: .theater);
                        context.push(context.ldvRoutes.tasks);
                      },
                    ),
                    _DashboardButton(
                      imagePath: 'assets/images/logo_baking.png',
                      onTap: () {
                        branchCubit.setBranch(branch: .baking);
                        context.push(context.ldvRoutes.tasks);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MySection extends StatelessWidget {
  const _MySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.ldvUiConstants.mobileSpacingSmall,
      children: [
        Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(24),
          child: LdvRoundedButton(
            height: 45,
            width: double.infinity,
            onTap: () {},
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.ldvUiConstants.mobileSpacing,
                vertical: context.ldvUiConstants.mobileSpacingSmall,
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Bernd-Thomas Martens',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: context.ldvUiConstants.mobileSpacing),
                  const LdvCircleButton(
                    decorationImage: DecorationImage(
                      image: AssetImage(
                        'assets/images/placeholder_profile.jpg',
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(24),
          child: LdvRoundedButton(
            height: 45,
            width: double.infinity,
            onTap: () {},
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.ldvUiConstants.mobileSpacing,
                vertical: context.ldvUiConstants.mobileSpacingSmall,
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Einstellungen',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: context.ldvUiConstants.mobileSpacing),
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.settings_outlined, size: 30),
                  ),

                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AppointmentSection extends StatelessWidget {
  const _AppointmentSection();

  @override
  Widget build(BuildContext context) {
    final appointments = context.select(
      (AppointmentCubit cubit) => cubit.state.appointments,
    );

    return SizedBox(
      height: 85,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: .horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];

          return Row(
            spacing: context.ldvUiConstants.mobileSpacingSmall,
            children: [
              if (appointment == appointments.first) ...[
                Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  child: LdvRoundedButton(
                    height: 85,
                    width: 140,
                    onTap: () {
                      context.read<BranchCubit>().resetBranch();
                      context.push('/appointments');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(
                        context.ldvUiConstants.mobileSpacingSmall,
                      ),
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo_ldv.png', height: 45),
                          const Spacer(),
                          const Text('Alle Termine'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],

              Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                borderRadius: context.ldvUiConstants.roundedBorderRadius,
                child: LdvRoundedButton(
                  height: 85,
                  width: 140,
                  onTap: () {
                    context.read<BranchCubit>().setBranch(
                      branch: appointment.branch,
                    );
                    context.push('/appointments/details', extra: appointment);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      context.ldvUiConstants.mobileSpacingSmall,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: context.ldvUiConstants.mobileSpacingSmall,
                      children: [
                        Text(
                          DateFormat(
                            'dd.MM.yyyy',
                            'de',
                          ).format(appointment.start),
                          style: const TextStyle(fontWeight: .bold),
                        ),

                        Text(
                          appointment.title,
                          overflow: .ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: context.ldvUiConstants.mobileSpacingSmall);
        },
      ),
    );
  }
}

class _DashboardSectionTitle extends StatelessWidget {
  const _DashboardSectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: context.ldvUiConstants
          .boxDecorationRounded(
            color: context.ldvColors.bitterSweet,
            withShadow: false,
          )
          .copyWith(border: Border.all(width: 1)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.ldvUiConstants.mobileSpacing,
        ),
        child: Text(title),
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      height: double.infinity,
      width: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
        child: child,
      ),
    );
  }
}
