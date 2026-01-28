import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/adapter/in/edit_task_state.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';
import 'package:ldv_app/features/task/domain/use_cases/create_task_use_case.dart';

@injectable
class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this._createTaskUseCase) : super(const EditTaskState());

  final CreateTaskUseCase _createTaskUseCase;

  Future<void> createTask({required Branch branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      await _createTaskUseCase(branch: branch, task: state.task);

      emit(state.copyWith(status: .success));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> setTitle({required String? value}) async {
    emit(state.copyWith(task: state.task.copyWith(title: value ?? '')));
  }

  Future<void> setDescription({required String? value}) async {
    emit(state.copyWith(task: state.task.copyWith(description: value ?? '')));
  }

  Future<void> setPriority({required TaskPriority value}) async {
    emit(state.copyWith(task: state.task.copyWith(priority: value)));
  }

  Future<void> setStatus({required TaskStatus value}) async {
    emit(state.copyWith(task: state.task.copyWith(status: value)));
  }
}
