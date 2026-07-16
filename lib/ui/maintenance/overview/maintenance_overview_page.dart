import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/maintenance/adapter/in/maintenance_overview_cubit.dart';
import 'package:ldv_app/features/maintenance/adapter/in/maintenance_overview_state.dart';
import 'package:ldv_app/ui/maintenance/overview/maintenance_overview_page_desktop.dart';
import 'package:ldv_app/ui/maintenance/overview/maintenance_overview_page_mobile.dart';
import 'package:ldv_app/ui/widgets/adaptive_layout.dart';
import 'package:ldv_app/ui/widgets/ldv_snackbar.dart';

class MaintenanceOverviewPage extends StatelessWidget {
  const MaintenanceOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final branch = context.select<BranchCubit, Branch>(
      (value) => value.state ?? Branch.unknown,
    );

    return BlocProvider(
      create: (context) {
        final cubit = getIt<MaintenanceOverviewCubit>();

        cubit.loadMaintenanceItems(branch: branch);

        return cubit;
      },

      child: BlocListener<MaintenanceOverviewCubit, MaintenanceOverviewState>(
        listener: (context, state) {
          if (state.status == .failure) {
            showLdvSnackbar(
              context: context,
              message: state.error ?? '',
              type: .error,
            );
          }
        },
        child: const AdaptiveLayout(
          mobile: MaintenanceOverviewPageMobile(),
          desktop: MaintenanceOverviewPageDesktop(),
        ),
      ),
    );
  }
}
