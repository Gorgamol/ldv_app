import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class DeleteTaskUseCase {
  const DeleteTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<void> call({required Task task}) async {
    return await _taskRepository.deleteTask(task: task);
  }
}
