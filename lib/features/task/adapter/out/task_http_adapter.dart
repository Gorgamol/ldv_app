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
  Future<void> createTask({required Task task, required Branch branch}) async {
    await _client.createTask(
      branch: branch,
      title: task.title,
      description: task.description,
      author: task.author,
      priority: task.priority,
      status: task.status,
    );
  }
}

extension _TaskDtoExtension on TaskDto {
  Task toDomain() {
    return Task(
      id: id,
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
