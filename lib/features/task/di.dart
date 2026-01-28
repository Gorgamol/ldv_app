import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/features/task/adapter/out/task_http_adapter.dart';
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart';

@module
abstract class TaskDependencyInjectionModule {
  TaskRepository get taskRepository {
    return getIt<TaskHttpAdapter>();
  }
}
