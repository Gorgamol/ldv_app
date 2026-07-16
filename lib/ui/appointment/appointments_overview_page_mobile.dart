import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/appointment/adapter/in/appointment_cubit.dart';
import 'package:ldv_app/features/appointment/adapter/in/appointment_state.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_loading_spinner.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_snackbar.dart';

class AppointmentsOverviewPageMobile extends StatelessWidget {
  const AppointmentsOverviewPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final branch = context.select((BranchCubit cubit) => cubit.state);

    return BlocProvider(
      create: (context) {
        return getIt<AppointmentCubit>()..loadAppointments(branch: branch);
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
        child: const _AppointmentsOverview(),
      ),
    );
  }
}

class _AppointmentsOverview extends StatelessWidget {
  const _AppointmentsOverview();

  @override
  Widget build(BuildContext context) {
    final branch = context.select((BranchCubit cubit) => cubit.state);
    final isLoading = context.select(
      (AppointmentCubit cubit) => cubit.state.status.isLoading,
    );

    return LdvScaffoldMobile(
      title: branch != null ? 'Termine' : 'Alle Termine',
      showBranchText: branch != null,
      onBack: () => context.pop(),
      content: isLoading
          ? const Center(
              child: LdvLoadingSpinner(loadingHint: 'Termine werden geladen'),
            )
          : const _AppointmentsView(),
      bottomNavigationBar: branch != null
          ? const BottomNavigationBarMobile()
          : null,
      floatingActionButton: LdvCircleButton(
        onTap: () {
          context.push('/appointments/details');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AppointmentsView extends StatefulWidget {
  const _AppointmentsView();

  @override
  State<_AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<_AppointmentsView> {
  final int _initialPage = 5000;
  late final PageController _pageController = PageController(
    initialPage: _initialPage,
  );
  late final DateTime _currentMonth = DateTime.now();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: PageView.builder(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final monthOffset = index - _initialPage;
          final indexedDate = DateTime(
            _currentMonth.year,
            _currentMonth.month + monthOffset,
          );

          debugPrint(_currentMonth.toIso8601String());
          debugPrint(indexedDate.toIso8601String());

          return Column(
            spacing: context.ldvUiConstants.mobileSpacingBig,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Icon(Icons.chevron_left, size: 32),
                  Text(
                    DateFormat('MMMM - yyyy', 'de').format(indexedDate),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 32),
                ],
              ),
              Flexible(child: _AppointmentsList(date: indexedDate)),
            ],
          );
        },
      ),
    );
  }
}

// ignore: unused_element
class _AppointmentsList extends StatelessWidget {
  const _AppointmentsList({required this.date, this.isCurrentMonth = false});

  final DateTime date;
  final bool isCurrentMonth;

  @override
  Widget build(BuildContext context) {
    final appointments = context.select(
      (AppointmentCubit cubit) => cubit.state.appointments,
    );

    final filteredAppointments = appointments
        .where(
          (appointment) =>
              appointment.start.month == date.month &&
              appointment.start.year == date.year,
        )
        .toList();

    final uniqueDates = filteredAppointments
        .map(
          (appointment) => DateTime(
            appointment.start.year,
            appointment.start.month,
            appointment.start.day,
          ),
        )
        .toSet()
        .toList();

    return filteredAppointments.isNotEmpty
        ? ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemCount: uniqueDates.length,
            itemBuilder: (context, index) {
              final current = uniqueDates[index];
              final appointmentsByDate = filteredAppointments
                  .where(
                    (appointment) => DateTime(
                      appointment.start.year,
                      appointment.start.month,
                      appointment.start.day,
                    ).isAtSameMomentAs(current),
                  )
                  .toList();

              return Column(
                children: [
                  Row(
                    spacing: context.ldvUiConstants.mobileSpacingSmall,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          indent: context.ldvUiConstants.mobileSpacingBig,
                        ),
                      ),
                      Text(
                        DateFormat('EEEE, dd. MMMM yyyy', 'de').format(current),
                        style: const TextStyle(fontWeight: .bold),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          endIndent: context.ldvUiConstants.mobileSpacingBig,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.ldvUiConstants.mobileSpacing),
                  for (final appointment in appointmentsByDate) ...[
                    //--------------------
                    LdvRoundedButton(
                      height: 45,
                      onTap: () {
                        context.push(
                          '/appointments/details',
                          extra: appointment,
                        );
                      },
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.ldvUiConstants.mobileSpacing,
                          ),
                          child: Row(
                            spacing: context.ldvUiConstants.mobileSpacing,
                            children: [
                              //SizedBox(width: 25, child: task.priority.toIcon()),
                              Expanded(
                                child: Text(
                                  appointment.title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              //task.status.toIcon(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.ldvUiConstants.mobileSpacingSmall),
                    //--------------------
                  ],
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: context.ldvUiConstants.mobileSpacingBig);
            },
          )
        : const Center(child: Text('Keine Termine gefunden.'));
  }
}
