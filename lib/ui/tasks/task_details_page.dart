import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_details_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/task_details_state.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_loading_spinner.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_snackbar.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key, required this.taskId});

  final String? taskId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (taskId != null) {
          return getIt<TaskDetailsCubit>()..loadTask(id: taskId ?? '');
        }

        return getIt<TaskDetailsCubit>()..initNewTask();
      },
      child: BlocListener<TaskDetailsCubit, TaskDetailsState>(
        listener: (context, state) {
          if (state.status == .failure) {
            showLdvSnackbar(
              context: context,
              message: state.error ?? '',
              type: .error,
            );
          }

          if (state.status == .success && state.taskUpdated) {
            showLdvSnackbar(
              context: context,
              message: 'Aufgabe wurde aktualisiert.',
            );
          }

          if (state.status == .success && state.taskCreated) {
            showLdvSnackbar(
              context: context,
              message: 'Aufgabe wurde angelegt.',
            );
          }

          if (state.status == .success && state.taskDeleted) {
            showLdvSnackbar(
              context: context,
              message: 'Aufgabe wurde gelöscht.',
            );
            context.go(context.ldvRoutes.tasks);
          }
        },
        child: const _TaskCreateView(),
      ),
    );
  }
}

class _TaskCreateView extends StatelessWidget {
  const _TaskCreateView();

  @override
  Widget build(BuildContext context) {
    final state = context.select((TaskDetailsCubit cubit) => cubit.state);
    final createdAt = state.editedTask?.createdAt ?? state.task.createdAt;
    final updatedAt = state.editedTask?.createdAt ?? state.task.updatedAt;
    final keyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;

    return LdvScaffoldMobile(
      title: state.isCreationMode ? 'Aufgabe erstellen' : 'Details',
      onBack: () => context.go(context.ldvRoutes.tasks),
      showBranchText: false,
      content: state.status == .loading
          ? const Center(child: LdvLoadingSpinner(loadingHint: 'Laden...'))
          : SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (createdAt != null) ...[
                        Expanded(
                          child: LdvTextField(
                            label: 'Erstellt am',
                            value: DateFormat(
                              'dd. MMMM yyyy',
                              'de',
                            ).format(createdAt),
                            textAlign: .center,
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          width: context.ldvUiConstants.mobileSpacingBig,
                        ),
                      ],
                      if (updatedAt != null) ...[
                        Expanded(
                          child: LdvTextField(
                            label: 'Aktualisiert am',
                            value: DateFormat(
                              'dd. MMMM yyyy',
                              'de',
                            ).format(updatedAt),
                            textAlign: .center,
                            enabled: false,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
                  const _CreatedBy(),
                  SizedBox(height: context.ldvUiConstants.mobileSpacingSmall),
                  const _AssignedTo(),
                  SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
                  LdvTextField(
                    value: state.editedTask?.title ?? state.task.title,
                    lines: 1,
                    label: 'Titel',
                    enabled: state.isEditMode,
                    onChanged: (value) =>
                        context.read<TaskDetailsCubit>().setTitle(value: value),
                  ),
                  SizedBox(height: context.ldvUiConstants.mobileSpacing),
                  LdvTextField(
                    value:
                        state.editedTask?.description ?? state.task.description,
                    lines: 5,
                    label: 'Aufgabenbeschreibung',
                    enabled: state.isEditMode,
                    onChanged: (value) => context
                        .read<TaskDetailsCubit>()
                        .setDescription(value: value),
                  ),
                  SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: LdvDropdownMenu<TaskPriority>(
                            label: 'Priorität',
                            onSelected: (value) {
                              if (value != null) {
                                context.read<TaskDetailsCubit>().setPriority(
                                  value: value,
                                );
                              }
                            },
                            initial:
                                state.editedTask?.priority ??
                                state.task.priority,
                            color:
                                state.editedTask?.priority.toColor() ??
                                state.task.priority.toColor(),
                            enabled: state.isEditMode,
                            disabledWidget: Row(
                              children: [
                                Text(
                                  state.editedTask?.priority
                                          .toStringTranslated() ??
                                      state.task.priority.toStringTranslated(),
                                ),
                                const Spacer(),
                                state.editedTask?.priority.toIcon() ??
                                    state.task.priority.toIcon(),
                              ],
                            ),
                            entries:
                                [
                                      TaskPriority.high,
                                      TaskPriority.normal,
                                      TaskPriority.low,
                                    ]
                                    .map(
                                      (priority) =>
                                          DropdownMenuEntry<TaskPriority>(
                                            value: priority,
                                            label: priority
                                                .toStringTranslated(),
                                            trailingIcon: priority.toIcon(),
                                          ),
                                    )
                                    .toList(),
                          ),
                        ),
                      ),
                      SizedBox(width: context.ldvUiConstants.mobileSpacingBig),
                      Expanded(
                        child: LdvDropdownMenu<TaskStatus>(
                          label: 'Status',
                          onSelected: (value) {
                            if (value != null) {
                              context.read<TaskDetailsCubit>().setStatus(
                                value: value,
                              );
                            }
                          },
                          initial:
                              state.editedTask?.status ?? state.task.status,
                          color:
                              state.editedTask?.status.toColor() ??
                              state.task.status.toColor(),
                          enabled: state.isEditMode,
                          disabledWidget: Row(
                            children: [
                              Text(
                                state.editedTask?.status.toStringTranslated() ??
                                    state.task.status.toStringTranslated(),
                              ),
                              const Spacer(),
                              state.editedTask?.status.toIcon() ??
                                  state.task.status.toIcon(),
                            ],
                          ),
                          entries:
                              [
                                    TaskStatus.finished,
                                    TaskStatus.open,
                                    TaskStatus.discarded,
                                  ]
                                  .map(
                                    (status) => DropdownMenuEntry<TaskStatus>(
                                      value: status,
                                      label: status.toStringTranslated(),
                                      trailingIcon: status.toIcon(),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButton: !keyboardVisible
          ? Builder(
              builder: (context) {
                final isEditMode = context.select(
                  (TaskDetailsCubit cubit) => cubit.state.isEditMode,
                );

                final isCreationMode = context.select(
                  (TaskDetailsCubit cubit) => cubit.state.isCreationMode,
                );

                final branch = context.select(
                  (BranchCubit cubit) => cubit.state,
                );

                return isEditMode
                    ? Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Row(
                          children: [
                            if (!isCreationMode) ...[
                              LdvCircleButton(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return _DeleteDialog(
                                        onDelete: () => context
                                            .read<TaskDetailsCubit>()
                                            .deleteTask(),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.delete_outline),
                              ),
                              const Spacer(),
                              LdvCircleButton(
                                onTap: () {
                                  context
                                      .read<TaskDetailsCubit>()
                                      .resetEditMode();
                                },
                                child: const Icon(Icons.close),
                              ),
                            ],
                            SizedBox(
                              width: context.ldvUiConstants.mobileSpacing,
                            ),
                            if (isCreationMode) ...[const Spacer()],
                            LdvCircleButton(
                              onTap: state.status == .loading
                                  ? null
                                  : () => isCreationMode
                                        ? context
                                              .read<TaskDetailsCubit>()
                                              .createTask(
                                                branch: branch ?? .unknown,
                                              )
                                        : context
                                              .read<TaskDetailsCubit>()
                                              .updateTask(),
                              child: const Icon(Icons.check),
                            ),
                          ],
                        ),
                      )
                    : LdvCircleButton(
                        onTap: () {
                          context.read<TaskDetailsCubit>().setEditMode();
                        },
                        child: const Icon(Icons.edit_outlined),
                      );
              },
            )
          : null,
    );
  }
}

class _DeleteDialog extends StatelessWidget {
  const _DeleteDialog({required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        decoration: context.ldvUiConstants.boxDecorationRounded(),
        padding: EdgeInsets.all(context.ldvUiConstants.mobileSpacing),
        width: double.infinity,
        child: Column(
          spacing: context.ldvUiConstants.mobileSpacing,
          mainAxisSize: .min,
          children: [
            const Text('Aufgabe löschen', style: TextStyle(fontWeight: .bold)),
            const Text(
              'Möchtest du die Aufgabe wirklich löschen?',
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                SizedBox(width: context.ldvUiConstants.mobileSpacing),
                Flexible(
                  child: SizedBox(
                    height: 30,
                    child: Material(
                      borderRadius: context.ldvUiConstants.roundedBorderRadius,
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
                      borderRadius: context.ldvUiConstants.roundedBorderRadius,
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      child: LdvRoundedButton(
                        onTap: () {
                          Navigator.of(context).pop();
                          onDelete.call();
                        },
                        child: const Center(child: Text('Löschen')),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: context.ldvUiConstants.mobileSpacing),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LdvDropdownMenu<T> extends StatelessWidget {
  const LdvDropdownMenu({
    super.key,
    required this.initial,
    required this.entries,
    this.enabled = true,
    this.color = Colors.white,
    this.disabledWidget,
    this.label,
    this.onSelected,
  });

  final T initial;
  final List<DropdownMenuEntry<T>> entries;
  final bool enabled;
  final Color color;
  final Widget? disabledWidget;
  final String? label;
  final void Function(T?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 2,
      children: [
        if (label != null) ...[
          Row(
            spacing: context.ldvUiConstants.mobileSpacingSmall,
            children: [
              if (enabled) ...[const Icon(Icons.edit_outlined, size: 16)],
              Text(
                '${label ?? ''}:',
                style: const TextStyle(fontWeight: .bold),
              ),
            ],
          ),
        ],
        Container(
          decoration: context.ldvUiConstants.boxDecorationRounded(
            withShadow: enabled,
            color: color,
          ),
          height: 40,
          padding: EdgeInsets.only(
            left: context.ldvUiConstants.mobileSpacingBig,
            right: enabled
                ? context.ldvUiConstants.mobileSpacingSmall
                : context.ldvUiConstants.mobileSpacingBig,
          ),
          child: Center(
            child: enabled
                ? DropdownMenu<T>(
                    onSelected: onSelected,
                    initialSelection: initial,
                    textStyle: TextTheme.of(context).bodyMedium,
                    dropdownMenuEntries: entries,
                    enableSearch: false,
                    enableFilter: false,
                    inputDecorationTheme: InputDecorationTheme(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(
                        const Size.fromHeight(40),
                      ),
                      isDense: true,
                      isCollapsed: true,
                    ),
                    menuStyle: const MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                    //enabled: false,
                  )
                : disabledWidget,
          ),
        ),
      ],
    );
  }
}

class LdvTextField extends StatefulWidget {
  const LdvTextField({
    super.key,
    this.label,
    this.value,
    this.required = false,
    this.lines = 1,
    this.textAlign = .start,
    this.enabled = true,
    this.onChanged,
    this.showEditIcon = true,
    this.showLabel = true,
  });

  final String? label;
  final int lines;
  final String? value;
  final TextAlign textAlign;
  final bool required;
  final bool enabled;
  final bool showEditIcon;
  final bool showLabel;
  final void Function(String)? onChanged;

  @override
  State<LdvTextField> createState() => _LdvTextFieldState();
}

class _LdvTextFieldState extends State<LdvTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? '';
  }

  @override
  void didUpdateWidget(covariant LdvTextField oldWidget) {
    _controller.text = widget.value ?? '';
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 2,
      children: [
        if (widget.label != null && widget.showLabel) ...[
          Row(
            spacing: context.ldvUiConstants.mobileSpacingSmall,
            children: [
              if (widget.enabled && widget.showEditIcon) ...[
                const Icon(Icons.edit_outlined, size: 16),
              ],
              Text(
                '${widget.label ?? ''}:',
                style: const TextStyle(fontWeight: .bold),
              ),
            ],
          ),
        ],
        Container(
          decoration: context.ldvUiConstants.boxDecorationRounded(
            withShadow: widget.enabled,
            color: context.ldvColors.grey,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.ldvUiConstants.mobileSpacing,
          ),
          child: Center(
            child: TextField(
              controller: _controller,
              onChanged: widget.onChanged,
              textAlign: widget.textAlign,
              textAlignVertical: .top,
              style: TextTheme.of(context).bodyMedium,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              minLines: widget.lines,
              maxLines: widget.lines,
              enabled: widget.enabled,
              decoration: InputDecoration(
                hintText: '${widget.label}...',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 4,
                ),
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AssignedTo extends StatelessWidget {
  const _AssignedTo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        const Text(
          'Zugewiesen:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text('Bernd-Thomas Martens'),
        SizedBox(width: context.ldvUiConstants.mobileSpacing),
        const LdvCircleButton(
          decorationImage: DecorationImage(
            image: AssetImage('assets/images/placeholder_profile.jpg'),
          ),
        ),
      ],
    );
  }
}

class _CreatedBy extends StatelessWidget {
  const _CreatedBy();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        const Text(
          'Erstellt von:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text('Bernd-Thomas Martens'),
        SizedBox(width: context.ldvUiConstants.mobileSpacing),
        const LdvCircleButton(
          decorationImage: DecorationImage(
            image: AssetImage('assets/images/placeholder_profile.jpg'),
          ),
        ),
      ],
    );
  }
}
