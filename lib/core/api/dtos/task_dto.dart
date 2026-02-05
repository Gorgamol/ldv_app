import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/api/dtos/category_dto.dart';
import 'package:ldv_app/features/task/domain/models/task_priority.dart';
import 'package:ldv_app/features/task/domain/models/task_status.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
abstract class TaskDto with _$TaskDto {
  const factory TaskDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'status') required TaskStatus status,
    @JsonKey(name: 'priority') required TaskPriority priority,
    @JsonKey(name: 'author') required String author,
    @JsonKey(name: 'branch') required String branch,
    @JsonKey(name: 'categories') required List<CategoryDto>? categories,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, Object?> json) =>
      _$TaskDtoFromJson(json);
}
