import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';

part 'task_filter.freezed.dart';

@freezed
abstract class TaskFilter with _$TaskFilter {
  const factory TaskFilter({
    @Default([]) List<TaskPriority> priority,
    @Default([]) List<TaskStatus> status,
    @Default('') String search,
  }) = _TaskFilter;
}
