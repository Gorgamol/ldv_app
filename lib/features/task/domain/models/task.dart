import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default(TaskStatus.open) TaskStatus status,
    @Default(TaskPriority.normal) TaskPriority priority,
    @Default('') String author,
    @Default(null) DateTime? createdAt,
    @Default(null) DateTime? updatedAt,
    @Default([]) List<Category> categories,
  }) = _Task;
}
