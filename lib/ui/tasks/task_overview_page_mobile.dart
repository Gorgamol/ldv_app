import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_state.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_loading_spinner.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_snackbar.dart';

class TaskOverviewPageMobile extends StatelessWidget {
  const TaskOverviewPageMobile({super.key});

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
            showLdvSnackbar(
              context: context,
              message: state.error ?? '',
              type: .error,
            );
          }
        },
        child: const _TaskOverviewContent(),
      ),
    );
  }
}

class _TaskOverviewContent extends StatelessWidget {
  const _TaskOverviewContent();

  @override
  Widget build(BuildContext context) {
    final status = context.select((TaskCubit cubit) => cubit.state.status);

    return LdvScaffoldMobile(
      title: context.translate.tasks,
      onBack: () => context.go(context.ldvRoutes.dashboard),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          const _SearchBar(),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          const _StatusFilter(),
          SizedBox(height: context.ldvUiConstants.mobileSpacing),
          const _PriorityFilter(),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          Expanded(
            child: switch (status) {
              .loading => const Center(
                child: LdvLoadingSpinner(
                  loadingHint: 'Aufgaben werden geladen',
                ),
              ),
              _ => const _TaskList(),
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarMobile(),
      floatingActionButton: LdvCircleButton(
        onTap: () {
          context.go('/tasks/details');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList();

  @override
  Widget build(BuildContext context) {
    final tasks = context.select(
      (TaskCubit cubit) => cubit.state.filteredTasks,
    );

    return tasks.isEmpty
        ? const Center(child: Text('Keine Aufgaben gefunden.'))
        : Column(
            spacing: context.ldvUiConstants.mobileSpacingSmall,
            children: [
              for (final task in tasks) ...[
                LdvRoundedButton(
                  height: 45,
                  onTap: () {
                    context.go('/tasks/details', extra: task.id);
                  },
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
          );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class _PriorityFilter extends StatelessWidget {
  const _PriorityFilter();

  @override
  Widget build(BuildContext context) {
    final priorityFilter = context.select(
      (TaskCubit cubit) => cubit.state.filter.priority,
    );

    final taskCubit = context.read<TaskCubit>();

    return _FilterWrap(
      title: 'Priorität',
      items: [
        _WrapElement(
          text: 'Alle',
          onTap: priorityFilter.isNotEmpty ? taskCubit.resetPriority : null,
          selected: priorityFilter.isEmpty,
        ),
        _WrapElement(
          text: TaskPriority.high.toStringTranslated(),
          onTap: priorityFilter.contains(TaskPriority.high)
              ? () => taskCubit.removePriority(value: TaskPriority.high)
              : () => taskCubit.setPriority(value: TaskPriority.high),
          selected: priorityFilter.contains(TaskPriority.high),
        ),
        _WrapElement(
          text: TaskPriority.normal.toStringTranslated(),
          onTap: priorityFilter.contains(TaskPriority.normal)
              ? () => taskCubit.removePriority(value: TaskPriority.normal)
              : () => taskCubit.setPriority(value: TaskPriority.normal),
          selected: priorityFilter.contains(TaskPriority.normal),
        ),
        _WrapElement(
          text: TaskPriority.low.toStringTranslated(),
          onTap: priorityFilter.contains(TaskPriority.low)
              ? () => taskCubit.removePriority(value: TaskPriority.low)
              : () => taskCubit.setPriority(value: TaskPriority.low),
          selected: priorityFilter.contains(TaskPriority.low),
        ),
      ],
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final statusFilter = context.select(
      (TaskCubit cubit) => cubit.state.filter.status,
    );

    final taskCubit = context.read<TaskCubit>();

    return _FilterWrap(
      title: 'Status',
      items: [
        _WrapElement(
          text: 'Alle',
          onTap: statusFilter.isNotEmpty ? taskCubit.resetStatus : null,
          selected: statusFilter.isEmpty,
        ),
        _WrapElement(
          text: TaskStatus.open.toStringTranslated(),
          onTap: statusFilter.contains(TaskStatus.open)
              ? () => taskCubit.removeStatus(value: TaskStatus.open)
              : () => taskCubit.setStatus(value: TaskStatus.open),
          selected: statusFilter.contains(TaskStatus.open),
        ),
        _WrapElement(
          text: TaskStatus.finished.toStringTranslated(),
          onTap: statusFilter.contains(TaskStatus.finished)
              ? () => taskCubit.removeStatus(value: TaskStatus.finished)
              : () => taskCubit.setStatus(value: TaskStatus.finished),
          selected: statusFilter.contains(TaskStatus.finished),
        ),
        _WrapElement(
          text: TaskStatus.discarded.toStringTranslated(),
          onTap: statusFilter.contains(TaskStatus.discarded)
              ? () => taskCubit.removeStatus(value: TaskStatus.discarded)
              : () => taskCubit.setStatus(value: TaskStatus.discarded),
          selected: statusFilter.contains(TaskStatus.discarded),
        ),
      ],
    );
  }
}

class _WrapElement {
  const _WrapElement({
    required this.text,
    required this.onTap,
    required this.selected,
  });

  final String text;
  final VoidCallback? onTap;
  final bool selected;
}

class _FilterWrap extends StatelessWidget {
  const _FilterWrap({required this.title, required this.items});

  final String title;
  final List<_WrapElement> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.ldvUiConstants.mobileSpacingSmall,
      alignment: WrapAlignment.start,
      children: [
        Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold)),
        for (final item in items) ...[
          Material(
            borderRadius: context.ldvUiConstants.roundedBorderRadius,
            child: InkWell(
              onTap: item.onTap,
              borderRadius: context.ldvUiConstants.roundedBorderRadius,
              child: Ink(
                height: 26,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: item.selected
                      ? context.ldvColors.bitterSweet
                      : context.ldvColors.white,
                  border: Border.all(width: 1),
                  borderRadius: context.ldvUiConstants.roundedBorderRadius,
                ),
                child: Text(item.text),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
