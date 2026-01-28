import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/adapter/in/task_state.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/features/task/domain/use_cases/load_all_tasks_use_case.dart';

@injectable
class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this._loadTasksUseCase) : super(const TaskState());

  final LoadAllTasksUseCase _loadTasksUseCase;

  Future<void> loadTasks({required Branch branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      final tasks = await _loadTasksUseCase(branch: branch);

      emit(state.copyWith(status: .success, tasks: tasks));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> setSearch({required String? value}) async {}

  Future<void> setPriority({required TaskPriority value}) async {}

  Future<void> setStatus({required TaskStatus value}) async {}
}
