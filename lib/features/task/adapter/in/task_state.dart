import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/utils/base_status.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';
import 'package:ldv_app/features/task/domain/models/task_filter.dart';

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState({
    @Default(BaseStatus.init) BaseStatus status,
    @Default([]) List<Task> tasks,
    @Default([]) List<Task> filteredTasks,
    @Default(TaskFilter()) TaskFilter filter,
    String? error,
  }) = _TaskState;
}
