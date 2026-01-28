import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

@injectable
class LoadTaskUseCase {
  const LoadTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<Task> call({required String id}) async {
    return await _taskRepository.fetchTask(id: id);
  }
}
