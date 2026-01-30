import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class LoadAllTasksUseCase {
  const LoadAllTasksUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<List<Task>> call({required Branch branch}) async {
    final tasks = await _taskRepository.fetchAllTasks(branch: branch);
    tasks.sort(
      (a, b) => (b.updatedAt ?? DateTime.now()).compareTo(
        a.updatedAt ?? DateTime.now(),
      ),
    );
    return tasks;
  }
}
