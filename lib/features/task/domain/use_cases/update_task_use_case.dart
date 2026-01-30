import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class UpdateTaskUseCase {
  const UpdateTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<({Task success, String? error})> call({required Task task}) async {
    final updatedTask = task.copyWith(updatedAt: DateTime.now());

    if (updatedTask.title.isEmpty) {
      return (
        success: updatedTask,
        error: 'Aufgaben Titel darf nicht leer sein.',
      );
    }

    if (updatedTask.description.isEmpty) {
      return (
        success: updatedTask,
        error: 'Aufgaben Beschreibung darf nicht leer sein.',
      );
    }

    await _taskRepository.updateTask(task: task);

    return (success: updatedTask, error: null);
  }
}
