import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/adapter/in/category_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/category_state.dart';
import 'package:ldv_app/features/task/adapter/in/task_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_state.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/ui/tasks/task_details_page.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return getIt<TaskCubit>()..loadTasks(branch: branch ?? .unknown);
          },
        ),
        BlocProvider(
          create: (context) {
            return getIt<CategoryCubit>()
              ..loadCategories(branch: branch ?? .unknown);
          },
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state.status == .failure) {
                showLdvSnackbar(
                  context: context,
                  message: state.error ?? '',
                  type: .error,
                );
              }
            },
          ),

          BlocListener<CategoryCubit, CategoryState>(
            listener: (context, state) {
              if (state.status == .failure) {
                showLdvSnackbar(
                  context: context,
                  message: state.error ?? '',
                  type: .error,
                );
              }
            },
          ),
        ],
        child: const _TaskOverviewContent(),
      ),
    );
  }
}

class _TaskOverviewContent extends StatelessWidget {
  const _TaskOverviewContent();

  @override
  Widget build(BuildContext context) {
    final taskStatus = context.select((TaskCubit cubit) => cubit.state.status);
    final categoryStatus = context.select(
      (CategoryCubit cubit) => cubit.state.status,
    );

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
          //SizedBox(height: context.ldvUiConstants.mobileSpacing),
          //const _CategoryFilter(),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          Expanded(
            child: taskStatus == .loading || categoryStatus == .loading
                ? const Center(
                    child: LdvLoadingSpinner(
                      loadingHint: 'Aufgaben werden geladen',
                    ),
                  )
                : const _TaskList(),
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
                  color: _getCardColor(task: task),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.ldvUiConstants.mobileSpacing,
                          ),
                          child: Row(
                            spacing: context.ldvUiConstants.mobileSpacing,
                            children: [
                              SizedBox(
                                width: 25,
                                child: task.priority.toIcon(),
                              ),
                              Expanded(
                                child: Text(
                                  task.title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              task.status.toIcon(),
                            ],
                          ),
                        ),
                      ),
                      if (task.status == .discarded) ...[
                        Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: context.ldvColors.black,
                          radius: context.ldvUiConstants.roundedBorderRadius,
                          indent: 15,
                          endIndent: 15,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ],
          );
  }

  Color _getCardColor({required Task task}) {
    if (task.status == .discarded || task.status == .finished) {
      return task.status.toColor();
    }

    return task.priority.toColor();
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

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter();

  @override
  Widget build(BuildContext context) {
    final categoryFilter = context.select(
      (TaskCubit cubit) => cubit.state.filter.category,
    );

    final categories = context.select(
      (CategoryCubit cubit) => cubit.state.categories,
    );

    final taskCubit = context.read<TaskCubit>();

    final branch = context.select((BranchCubit cubit) => cubit.state);

    return _FilterWrap(
      title: 'Kategorien',
      items: [
        _WrapElement(
          text: 'Alle',
          onTap: categoryFilter.isNotEmpty ? taskCubit.resetCategory : null,
          selected: categoryFilter.isEmpty,
        ),
        for (final category in categories) ...[
          _WrapElement(
            text: category.name,
            onTap: categoryFilter.contains(category)
                ? () => taskCubit.removeCategory(value: category)
                : () => taskCubit.setCategory(value: category),
            selected: categoryFilter.contains(category),
          ),
        ],
        _WrapElement(
          text: '+',
          onTap: () async {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return _CategoryDialog(
                  onCategoryCreate: (name) {
                    context.read<CategoryCubit>().addCategory(
                      name: name,
                      branch: branch ?? .unknown,
                    );
                  },
                );
              },
            );
          },
          selected: categoryFilter.isEmpty,
          colorOverride: context.ldvColors.dustyGrayLight,
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
    this.colorOverride,
  });

  final String text;
  final VoidCallback? onTap;
  final bool selected;
  final Color? colorOverride;
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
                  color:
                      item.colorOverride ??
                      (item.selected
                          ? context.ldvColors.bitterSweet
                          : context.ldvColors.white),
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

class _CategoryDialog extends StatefulWidget {
  const _CategoryDialog({required this.onCategoryCreate});

  final void Function(String) onCategoryCreate;

  @override
  State<_CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<_CategoryDialog> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        decoration: context.ldvUiConstants.boxDecorationRounded(),
        padding: EdgeInsets.all(context.ldvUiConstants.mobileSpacing),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.ldvUiConstants.mobileSpacing,
          ),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Text(
                  'Neue Kategorie für ${getIt<BranchCubit>().state?.toL10nString()}',
                  style: const TextStyle(fontWeight: .bold),
                ),
              ),
              SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
              const Text(
                'Name der neuen Kategorie',
                textAlign: TextAlign.start,
              ),
              SizedBox(height: context.ldvUiConstants.mobileSpacingSmall),
              LdvTextField(
                label: 'Name',
                showEditIcon: false,
                showLabel: false,
                onChanged: (value) {
                  _name = value;
                },
              ),
              SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 30,
                      child: Material(
                        borderRadius:
                            context.ldvUiConstants.roundedBorderRadius,
                        color: Colors.transparent,
                        clipBehavior: Clip.hardEdge,
                        shadowColor: Colors.transparent,
                        child: LdvRoundedButton(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Center(child: Text('Abbrechen')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: context.ldvUiConstants.mobileSpacing),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                      child: Material(
                        borderRadius:
                            context.ldvUiConstants.roundedBorderRadius,
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: LdvRoundedButton(
                          onTap: () {
                            Navigator.of(context).pop();
                            widget.onCategoryCreate.call(_name);
                          },
                          child: const Center(child: Text('Erstellen')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
