import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';

abstract interface class TaskRepository {
  Future<List<Task>> fetchAllTasks({required Branch branch});

  Future<Task> fetchTask({required String id});

  Future<Task> createTask({required Task task, required Branch branch});

  Future<void> updateTask({required Task task});
}
