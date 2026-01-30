import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class CreateTaskUseCase {
  const CreateTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<({Task? success, String? error})> call({
    required Task task,
    required Branch branch,
  }) async {
    if (task.title.isEmpty) {
      return (success: null, error: 'Aufgaben Titel darf nicht leer sein.');
    }

    if (task.description.isEmpty) {
      return (
        success: null,
        error: 'Aufgaben Beschreibung darf nicht leer sein.',
      );
    }

    final newTask = await _taskRepository.createTask(
      task: task,
      branch: branch,
    );

    return (success: newTask, error: null);
  }
}
