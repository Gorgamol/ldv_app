import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/adapter/in/task_details_state.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/features/task/domain/use_cases/create_task_use_case.dart';
import 'package:ldv_app/features/task/domain/use_cases/load_task_use_case.dart';
import 'package:ldv_app/features/task/domain/use_cases/update_task_use_case.dart';

@injectable
class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(
    this._loadTaskUseCase,
    this._createTaskUseCase,
    this._updateTaskUseCase,
  ) : super(const TaskDetailsState());

  final LoadTaskUseCase _loadTaskUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  Future<void> loadTask({required String id}) async {
    emit(state.copyWith(status: .loading));

    try {
      final task = await _loadTaskUseCase(id: id);

      emit(state.copyWith(status: .success, task: task));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> initNewTask() async {
    emit(state.copyWith(status: .loading));

    try {
      emit(
        state.copyWith(
          status: .success,
          editedTask: Task(
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            author: 'Bernd-Thomas Martens',
          ),
          isEditMode: true,
          isCreationMode: true,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> setEditMode() async {
    emit(
      state.copyWith(
        status: .success,
        isEditMode: true,
        editedTask: state.task,
        taskUpdated: false,
        taskCreated: false,
      ),
    );
  }

  Future<void> resetEditMode() async {
    emit(state.copyWith(status: .success, isEditMode: false, editedTask: null));
  }

  Future<void> updateTask() async {
    emit(state.copyWith(status: .loading));

    try {
      final task = state.task;
      final editedTask = state.editedTask;

      if (editedTask != null) {
        final result = await _updateTaskUseCase(task: editedTask);

        emit(
          state.copyWith(
            status: result.error != null ? .failure : .success,
            task: result.error != null ? task : result.success,
            taskUpdated: result.error != null,
            error: result.error,
            isEditMode: result.error != null,
          ),
        );
      } else {
        emit(state.copyWith(status: .failure, error: L10n.current.error));
      }
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> createTask({required Branch branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      final result = await _createTaskUseCase(
        branch: branch,
        task: state.editedTask ?? state.task,
      );
      final success = result.success;
      final error = result.error;

      if (success != null) {
        emit(
          state.copyWith(
            status: .success,
            task: success,
            taskCreated: true,
            isEditMode: false,
            isCreationMode: false,
          ),
        );
      }

      if (error != null) {
        emit(state.copyWith(status: .failure, error: error));
      }
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> setTitle({required String? value}) async {
    final editedTask = state.editedTask?.copyWith(title: value ?? '');

    if (editedTask != null) {
      emit(state.copyWith(status: .success, editedTask: editedTask));
    }
  }

  Future<void> setDescription({required String? value}) async {
    final editedTask = state.editedTask?.copyWith(description: value ?? '');

    if (editedTask != null) {
      emit(state.copyWith(status: .success, editedTask: editedTask));
    }
  }

  Future<void> setPriority({required TaskPriority value}) async {
    final editedTask = state.editedTask?.copyWith(priority: value);

    if (editedTask != null) {
      emit(state.copyWith(status: .success, editedTask: editedTask));
    }
  }

  Future<void> setStatus({required TaskStatus value}) async {
    final editedTask = state.editedTask?.copyWith(status: value);

    if (editedTask != null) {
      emit(state.copyWith(status: .success, editedTask: editedTask));
    }
  }
}
