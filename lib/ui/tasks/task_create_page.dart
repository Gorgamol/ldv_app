import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/core/routing/ldv_routes.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/edit_task_cubit.dart';
import 'package:ldv_app/features/task/adapter/in/edit_task_state.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';

class TaskCreatePage extends StatelessWidget {
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<EditTaskCubit>();
      },
      child: BlocListener<EditTaskCubit, EditTaskState>(
        listener: (context, state) {
          if (state.status == .failure) {
            // Show Error Dialog
          }

          if (state.status == .success) {
            context.go(LdvRoutes().tasks);
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
    final editTaskCubit = context.read<EditTaskCubit>();

    return LdvScaffoldMobile(
      title: 'Aufgabe erstellen',
      onBack: () => context.go(context.ldvRoutes.tasks),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const Text(
                'Erstellt von:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 30),
              Text(
                'Bernd-Thomas Martens - ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
              ),
            ],
          ),
          DecoratedBox(
            decoration: context.ldvUiConstants.boxDecorationRounded(
              withShadow: false,
            ),
            child: TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: 12,
                  right: 6,
                ),
                hintText: "Aufgabe...",
                border: InputBorder.none,
                isDense: true,
              ),
              maxLines: 1,
              onChanged: (value) {
                editTaskCubit.setTitle(value: value);
              },
            ),
          ),
          DecoratedBox(
            decoration: context.ldvUiConstants.boxDecorationRounded(
              withShadow: false,
            ),
            child: TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: 12,
                  right: 6,
                ),
                hintText: "Beschreibung der Aufgabe...",
                border: InputBorder.none,
                isDense: true,
              ),
              maxLines: 5,
              onChanged: (value) {
                editTaskCubit.setDescription(value: value);
              },
            ),
          ),
          Row(
            children: [
              const Text(
                'Priorität:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Builder(
                builder: (context) {
                  final priority = context.select(
                    (EditTaskCubit cubit) => cubit.state.task.priority,
                  );

                  return Container(
                    width: 120,
                    decoration: context.ldvUiConstants.boxDecorationRounded(
                      withShadow: false,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<TaskPriority>(
                        value: priority,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 0,
                        ),
                        items: const [
                          DropdownMenuItem<TaskPriority>(
                            value: .low,
                            child: Text('Niedrig'),
                          ),
                          DropdownMenuItem<TaskPriority>(
                            value: .normal,
                            child: Text('Normal'),
                          ),
                          DropdownMenuItem<TaskPriority>(
                            value: .high,
                            child: Text('Hoch'),
                          ),
                        ],
                        dropdownColor: Colors.white,

                        onChanged: (value) {
                          if (value != null) {
                            editTaskCubit.setPriority(value: value);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              const Text(
                'Status:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Builder(
                builder: (context) {
                  final status = context.select(
                    (EditTaskCubit cubit) => cubit.state.task.status,
                  );

                  return Container(
                    width: 120,
                    decoration: context.ldvUiConstants.boxDecorationRounded(
                      withShadow: false,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<TaskStatus>(
                        value: status,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 0,
                        ),
                        items: const [
                          DropdownMenuItem<TaskStatus>(
                            value: .discarded,
                            child: Text('Verworfen'),
                          ),
                          DropdownMenuItem<TaskStatus>(
                            value: .open,
                            child: Text('Offen'),
                          ),
                          DropdownMenuItem<TaskStatus>(
                            value: .finished,
                            child: Text('Erledigt'),
                          ),
                        ],
                        dropdownColor: Colors.white,

                        onChanged: (value) {
                          if (value != null) {
                            editTaskCubit.setStatus(value: value);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: .centerRight,
            child: Builder(
              builder: (context) {
                final status = context.select(
                  (EditTaskCubit cubit) => cubit.state.status,
                );

                return LdvRoundedButton(
                  height: 45,
                  width: 160,
                  color: LdvColors().bitterSweet,
                  onTap: () {
                    editTaskCubit.createTask(
                      branch: context.read<BranchCubit>().state ?? .unknown,
                    );
                  },
                  child: Center(
                    child: status == .loading
                        ? const CircularProgressIndicator()
                        : const Text('Aufgabe erstellen'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
