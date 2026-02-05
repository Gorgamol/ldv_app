import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/adapter/in/task_state.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/features/task/domain/use_cases/filter_tasks_use_case.dart';
import 'package:ldv_app/features/task/domain/use_cases/load_all_tasks_use_case.dart';

@injectable
class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this._loadTasksUseCase, this._filterTasksUseCase)
    : super(const TaskState());

  final LoadAllTasksUseCase _loadTasksUseCase;
  final FilterTasksUseCase _filterTasksUseCase;

  Future<void> loadTasks({required Branch branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      final tasks = await _loadTasksUseCase(branch: branch);

      emit(
        state.copyWith(status: .success, tasks: tasks, filteredTasks: tasks),
      );
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> setSearch({required String? value}) async {
    final changedFilter = state.filter.copyWith(search: value ?? '');
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> setPriority({required TaskPriority value}) async {
    final changedFilter = state.filter.copyWith(
      priority: [...state.filter.priority, value],
    );
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> removePriority({required TaskPriority value}) async {
    final changedFilter = state.filter.copyWith(
      priority: [...state.filter.priority]..remove(value),
    );
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> resetPriority() async {
    final changedFilter = state.filter.copyWith(priority: []);
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> setStatus({required TaskStatus value}) async {
    final changedFilter = state.filter.copyWith(
      status: [...state.filter.status, value],
    );
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> removeStatus({required TaskStatus value}) async {
    final changedFilter = state.filter.copyWith(
      status: [...state.filter.status]..remove(value),
    );
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> resetStatus() async {
    final changedFilter = state.filter.copyWith(status: []);
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> setCategory({required Category value}) async {
    final changedFilter = state.filter.copyWith(
      category: [...state.filter.category, value],
    );
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> removeCategory({required Category value}) async {
    final changedFilter = state.filter.copyWith(
      category: [...state.filter.category]..remove(value),
    );
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }

  Future<void> resetCategory() async {
    final changedFilter = state.filter.copyWith(category: []);
    final filteredTasks = _filterTasksUseCase(
      tasks: state.tasks,
      filter: changedFilter,
    );

    emit(
      state.copyWith(
        status: .success,
        filteredTasks: filteredTasks,
        filter: changedFilter,
      ),
    );
  }
}
