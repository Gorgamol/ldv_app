import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/api/dtos/task_dto.dart';
import 'package:ldv_app/core/api/ldv_http_client.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class TaskHttpAdapter implements TaskRepository {
  TaskHttpAdapter(this._client);

  final LdvHttpClient _client;

  @override
  Future<List<Task>> fetchAllTasks({required Branch branch}) async {
    final taskDtos = await _client.getTasksByBranch(branch: branch);

    return taskDtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<Task> fetchTask({required String id}) async {
    final taskDto = await _client.getTask(id: id);

    return taskDto.toDomain();
  }

  @override
  Future<Task> createTask({required Task task, required Branch branch}) async {
    final taskDto = await _client.createTask(
      branch: branch,
      task: task.toDto(branch: branch),
    );

    return taskDto.toDomain();
  }

  @override
  Future<void> updateTask({required Task task}) async {
    await _client.updateTask(
      id: task.id,
      task: task.toDto(branch: .unknown),
    );
  }
}

extension _TaskDtoExtension on TaskDto {
  Task toDomain() {
    return Task(
      id: id.toString(),
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      author: author,
      priority: priority,
      status: status,
    );
  }
}

extension _TaskDomainExtension on Task {
  TaskDto toDto({required Branch branch}) {
    return TaskDto(
      branch: branch.toString(),
      id: 0,
      title: title,
      description: description,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
      author: author,
      priority: priority,
      status: status,
    );
  }
}
