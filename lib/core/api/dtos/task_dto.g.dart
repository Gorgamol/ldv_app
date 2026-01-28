// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => _TaskDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  status: $enumDecode(_$TaskStatusEnumMap, json['status']),
  priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
  author: json['author'] as String,
  branch: json['branch'] as String,
);

Map<String, dynamic> _$TaskDtoToJson(_TaskDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'status': _$TaskStatusEnumMap[instance.status]!,
  'priority': _$TaskPriorityEnumMap[instance.priority]!,
  'author': instance.author,
  'branch': instance.branch,
};

const _$TaskStatusEnumMap = {
  TaskStatus.open: 'open',
  TaskStatus.discarded: 'discarded',
  TaskStatus.finished: 'finished',
  TaskStatus.unknown: 'unknown',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.normal: 'normal',
  TaskPriority.high: 'high',
  TaskPriority.unknown: 'unknown',
};
