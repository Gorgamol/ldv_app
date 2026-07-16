import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/category_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/category_state.dart';
import 'package:ldv_app/features/task/adapter/in/task_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_state.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';
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
      onBack: () => context.pop(),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: context.ldvUiConstants.mobileSpacingSmall,
            children: const [
              _SortButton(),
              Expanded(child: _SearchBar()),
              //_FilterButton(),
            ],
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          const _StatusFilter(),
          SizedBox(height: context.ldvUiConstants.mobileSpacing),
          const _PriorityFilter(),
          SizedBox(height: context.ldvUiConstants.mobileSpacing),
          const _CategoryFilter(),
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
          context.push('/tasks/details');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SortButton extends StatefulWidget {
  const _SortButton();

  @override
  State<_SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<_SortButton> {
  final _key = LabeledGlobalKey("sort_button");
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LdvCircleButton(
      key: _key,
      onTap: () {
        if (_isMenuOpen) {
          _hideOverlay();
        } else {
          _showOverlay();
        }
      },
      child: const Icon(Icons.sort),
    );
  }

  void _showOverlay() {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    final overlay = _overlayEntryBuilder(
      buttonPosition: renderBox.localToGlobal(Offset.zero),
      buttonSize: renderBox.size,
    );

    Overlay.of(context).insert(overlay);
    _isMenuOpen = true;
    _overlayEntry = overlay;
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _isMenuOpen = false;
    _overlayEntry = null;
  }

  OverlayEntry _overlayEntryBuilder({
    required Offset buttonPosition,
    required Size buttonSize,
  }) {
    final taskCubit = context.read<TaskCubit>();
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: _hideOverlay,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top:
                  buttonPosition.dy +
                  buttonSize.height +
                  context.ldvUiConstants.mobileSpacingSmall,
              left: buttonPosition.dx,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 130,
                  decoration: context.ldvUiConstants
                      .boxDecorationRounded()
                      .copyWith(borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          context.ldvUiConstants.mobileSpacing,
                        ),
                        child: const Text(
                          'Sortieren nach',
                          style: TextStyle(fontWeight: .bold),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            taskCubit.setSort(value: .date);
                            _hideOverlay();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.ldvUiConstants.mobileSpacing,
                              top: context.ldvUiConstants.mobileSpacingSmall,
                              bottom: context.ldvUiConstants.mobileSpacingSmall,
                            ),
                            child: Row(
                              spacing:
                                  context.ldvUiConstants.mobileSpacingSmall,
                              children: const [
                                Icon(Icons.calendar_month_outlined, size: 24),
                                Text('Datum'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            taskCubit.setSort(value: .name);
                            _hideOverlay();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.ldvUiConstants.mobileSpacing,
                              top: context.ldvUiConstants.mobileSpacingSmall,
                              bottom: context.ldvUiConstants.mobileSpacingSmall,
                            ),
                            child: Row(
                              spacing:
                                  context.ldvUiConstants.mobileSpacingSmall,
                              children: const [
                                Icon(Icons.abc, size: 24),
                                Text('Titel'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.ldvUiConstants.mobileSpacingSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FilterButton extends StatefulWidget {
  const _FilterButton();

  @override
  State<_FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<_FilterButton> {
  final _key = LabeledGlobalKey("filter_button");
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LdvCircleButton(
      key: _key,
      onTap: () {
        if (_isMenuOpen) {
          _hideOverlay();
        } else {
          _showOverlay();
        }
      },
      child: const Icon(Icons.sort),
    );
  }

  void _showOverlay() {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    final overlay = _overlayEntryBuilder(
      buttonPosition: renderBox.localToGlobal(Offset.zero),
      buttonSize: renderBox.size,
    );

    Overlay.of(context).insert(overlay);
    _isMenuOpen = true;
    _overlayEntry = overlay;
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _isMenuOpen = false;
    _overlayEntry = null;
  }

  OverlayEntry _overlayEntryBuilder({
    required Offset buttonPosition,
    required Size buttonSize,
  }) {
    final taskCubit = context.read<TaskCubit>();
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: _hideOverlay,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top:
                  buttonPosition.dy +
                  buttonSize.height +
                  context.ldvUiConstants.mobileSpacingSmall,
              right: context.ldvUiConstants.mobileSpacing,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 250,
                  decoration: context.ldvUiConstants
                      .boxDecorationRounded()
                      .copyWith(borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          context.ldvUiConstants.mobileSpacing,
                        ),
                        child: const Text(
                          'Filtern nach',
                          style: TextStyle(fontWeight: .bold),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            taskCubit.setSort(value: .date);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.ldvUiConstants.mobileSpacing,
                              top: context.ldvUiConstants.mobileSpacingSmall,
                              bottom: context.ldvUiConstants.mobileSpacingSmall,
                            ),
                            child: Row(
                              spacing:
                                  context.ldvUiConstants.mobileSpacingSmall,
                              children: const [
                                Icon(Icons.calendar_month_outlined, size: 24),
                                Text('Datum'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            taskCubit.setSort(value: .name);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.ldvUiConstants.mobileSpacing,
                              top: context.ldvUiConstants.mobileSpacingSmall,
                              bottom: context.ldvUiConstants.mobileSpacingSmall,
                            ),
                            child: Row(
                              spacing:
                                  context.ldvUiConstants.mobileSpacingSmall,
                              children: const [
                                Icon(Icons.abc, size: 24),
                                Text('Titel'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.ldvUiConstants.mobileSpacingSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
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
                    context.push('/tasks/details', extra: task.id);
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
