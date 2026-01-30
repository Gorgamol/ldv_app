import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/utils/search_helper.dart';
import 'package:ldv_app/features/task/domain/models/task.dart';
import 'package:ldv_app/features/task/domain/models/task_filter.dart';

@injectable
class FilterTasksUseCase {
  const FilterTasksUseCase();

  List<Task> call({required List<Task> tasks, required TaskFilter filter}) {
    final searchFilter = filter.search;
    final priorityFilter = filter.priority;
    final statusFilter = filter.status;

    final filteredTasks = List<Task>.from(tasks, growable: true);

    if (searchFilter.isNotEmpty) {
      filteredTasks.removeWhere(
        (task) => !containsSearchValue(
          value: searchFilter,
          fields: [task.title, task.description, task.author],
        ),
      );
    }

    if (priorityFilter.isNotEmpty) {
      filteredTasks.removeWhere((task) {
        final containsTaskPriority = priorityFilter.any(
          (priority) => priority == task.priority,
        );

        return !containsTaskPriority;
      });
    }

    if (statusFilter.isNotEmpty) {
      filteredTasks.removeWhere((task) {
        final containsTaskStatus = statusFilter.any(
          (status) => status == task.status,
        );

        return !containsTaskStatus;
      });
    }

    return filteredTasks;
  }
}
