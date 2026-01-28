import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/utils/base_status.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

part 'edit_task_state.freezed.dart';

@freezed
abstract class EditTaskState with _$EditTaskState {
  const factory EditTaskState({
    @Default(BaseStatus.init) BaseStatus status,
    @Default(Task()) Task task,
    String? error,
  }) = _EditTaskState;
}
