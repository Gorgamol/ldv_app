import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/routing/ldv_routes.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_state.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';

class TasksPageMobile extends StatelessWidget {
  const TasksPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final branch = context.select((BranchCubit cubit) => cubit.state);

    return BlocProvider(
      create: (context) {
        return getIt<TaskCubit>()..loadTasks(branch: branch ?? .unknown);
      },
      child: BlocListener<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state.status == .failure) {
            // Show Error Dialog
          }
        },
        child: const _TaskView(),
      ),
    );
  }
}

class _TaskView extends StatelessWidget {
  const _TaskView();

  @override
  Widget build(BuildContext context) {
    final taskState = context.select((TaskCubit cubit) => cubit.state);

    return LdvScaffoldMobile(
      title: context.translate.tasks,
      onBack: () => context.go(context.ldvRoutes.dashboard),
      content: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: SearchBar(
              onChanged: (value) {
                context.read<TaskCubit>().setSearch(value: value);
              },
              leading: const Icon(Icons.search),
              hintText: 'Aufgaben durchsuchen...',
              backgroundColor: WidgetStateColor.resolveWith(
                (states) => context.ldvColors.white,
              ),
              overlayColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return context.ldvColors.grey;
                }

                if (states.contains(WidgetState.hovered)) {
                  return context.ldvColors.grey;
                }

                return context.ldvColors.white;
              }),
              side: WidgetStateBorderSide.resolveWith(
                (states) => const BorderSide(width: 1.5),
              ),
            ),
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: context.ldvUiConstants.mobileSpacingSmall,
              alignment: WrapAlignment.start,
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.ldvColors.bitterSweet,
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Alle'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Offen'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Erledigt'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Verworfen'),
                ),
              ],
            ),
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacing),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: context.ldvUiConstants.mobileSpacingSmall,
              alignment: WrapAlignment.start,
              children: [
                const Text(
                  'Priorität:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.ldvColors.bitterSweet,
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Alle'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Hoch'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Normal'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Niedrig'),
                ),
              ],
            ),
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          if (taskState.status == .loading) ...[
            const Center(child: CircularProgressIndicator()),
          ] else ...[
            Column(
              spacing: context.ldvUiConstants.mobileSpacingSmall,
              children: [
                if (taskState.tasks.isEmpty) ...[
                  const Center(child: Text('Noch keine Aufgaben vorhanden')),
                ],
                for (final task in taskState.tasks) ...[
                  LdvRoundedButton(
                    height: 45,
                    onTap: () {},
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(
                                width: context.ldvUiConstants.mobileSpacing,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  task.priority.toStringTranslated(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: task.status == .discarded
                                        ? context.ldvColors.dustyGray
                                        : context.ldvColors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  task.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: task.status == .discarded
                                        ? context.ldvColors.dustyGray
                                        : context.ldvColors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  switch (task.status) {
                                    .discarded => Icons.cancel_outlined,
                                    _ => Icons.check_circle_outline,
                                  },
                                  color: switch (task.status) {
                                    .discarded => context.ldvColors.dustyGray,
                                    .open => context.ldvColors.dustyGray,
                                    _ => Colors.green,
                                  },
                                ),
                              ),
                              SizedBox(
                                width: context.ldvUiConstants.mobileSpacing,
                              ),
                            ],
                          ),
                        ),
                        if (task.status == .discarded) ...[
                          Divider(
                            thickness: 1.5,
                            height: 1.5,
                            color: context.ldvColors.black,
                            radius: context.ldvUiConstants.roundedBorderRadius,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarMobile(),

      floatingActionButton: LdvCircleButton(
        onTap: () {
          context.go(LdvRoutes().createTask);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
