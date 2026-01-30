import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/utils/base_status.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

part 'task_details_state.freezed.dart';

@freezed
abstract class TaskDetailsState with _$TaskDetailsState {
  const factory TaskDetailsState({
    @Default(BaseStatus.init) BaseStatus status,
    @Default(Task()) Task task,
    @Default(null) Task? editedTask,
    @Default(false) bool isEditMode,
    @Default(false) bool isCreationMode,
    @Default(false) bool taskCreated,
    @Default(false) bool taskUpdated,
    @Default(false) bool taskDeleted,
    String? error,
  }) = _TaskDetailsState;
}
