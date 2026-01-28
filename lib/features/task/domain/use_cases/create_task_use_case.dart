import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class CreateTaskUseCase {
  const CreateTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<void> call({required Task task, required Branch branch}) async {
    return await _taskRepository.createTask(task: task, branch: branch);
  }
}
