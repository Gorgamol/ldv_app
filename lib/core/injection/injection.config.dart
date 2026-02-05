// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ldv_app/core/api/ldv_http_client.dart' as _i755;
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart' as _i999;
import 'package:ldv_app/features/task/adapter/in/category_cubit.dart' as _i1072;
import 'package:ldv_app/features/task/adapter/in/task_cubit.dart' as _i1040;
import 'package:ldv_app/features/task/adapter/in/task_details_cubit.dart'
    as _i149;
import 'package:ldv_app/features/task/adapter/out/category_http_adapter.dart'
    as _i895;
import 'package:ldv_app/features/task/adapter/out/task_http_adapter.dart'
    as _i915;
import 'package:ldv_app/features/task/di.dart' as _i598;
import 'package:ldv_app/features/task/domain/interfaces/category_repository.dart'
    as _i650;
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart'
    as _i555;
import 'package:ldv_app/features/task/domain/use_cases/create_category_use_case.dart'
    as _i35;
import 'package:ldv_app/features/task/domain/use_cases/create_task_use_case.dart'
    as _i914;
import 'package:ldv_app/features/task/domain/use_cases/delete_task_use_case.dart'
    as _i232;
import 'package:ldv_app/features/task/domain/use_cases/filter_tasks_use_case.dart'
    as _i837;
import 'package:ldv_app/features/task/domain/use_cases/load_all_tasks_use_case.dart'
    as _i279;
import 'package:ldv_app/features/task/domain/use_cases/load_categories_use_case.dart'
    as _i1036;
import 'package:ldv_app/features/task/domain/use_cases/load_task_use_case.dart'
    as _i813;
import 'package:ldv_app/features/task/domain/use_cases/update_task_use_case.dart'
    as _i214;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final ldvHttpClientModule = _$LdvHttpClientModule();
    final taskDependencyInjectionModule = _$TaskDependencyInjectionModule();
    final categoryDependencyInjectionModule =
        _$CategoryDependencyInjectionModule();
    gh.factory<_i755.LdvHttpClient>(() => ldvHttpClientModule.getHttpClient());
    gh.factory<_i555.TaskRepository>(
      () => taskDependencyInjectionModule.taskRepository,
    );
    gh.factory<_i650.CategoryRepository>(
      () => categoryDependencyInjectionModule.categoryRepository,
    );
    gh.factory<_i837.FilterTasksUseCase>(
      () => const _i837.FilterTasksUseCase(),
    );
    gh.lazySingleton<_i999.BranchCubit>(() => _i999.BranchCubit());
    gh.factory<_i35.CreateCategoryUseCase>(
      () => _i35.CreateCategoryUseCase(gh<_i650.CategoryRepository>()),
    );
    gh.factory<_i1036.LoadCategoriesUseCase>(
      () => _i1036.LoadCategoriesUseCase(gh<_i650.CategoryRepository>()),
    );
    gh.factory<_i895.CategoryHttpAdapter>(
      () => _i895.CategoryHttpAdapter(gh<_i755.LdvHttpClient>()),
    );
    gh.factory<_i915.TaskHttpAdapter>(
      () => _i915.TaskHttpAdapter(gh<_i755.LdvHttpClient>()),
    );
    gh.factory<_i1072.CategoryCubit>(
      () => _i1072.CategoryCubit(
        gh<_i1036.LoadCategoriesUseCase>(),
        gh<_i35.CreateCategoryUseCase>(),
      ),
    );
    gh.factory<_i914.CreateTaskUseCase>(
      () => _i914.CreateTaskUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i232.DeleteTaskUseCase>(
      () => _i232.DeleteTaskUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i279.LoadAllTasksUseCase>(
      () => _i279.LoadAllTasksUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i813.LoadTaskUseCase>(
      () => _i813.LoadTaskUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i214.UpdateTaskUseCase>(
      () => _i214.UpdateTaskUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i1040.TaskCubit>(
      () => _i1040.TaskCubit(
        gh<_i279.LoadAllTasksUseCase>(),
        gh<_i837.FilterTasksUseCase>(),
      ),
    );
    gh.factory<_i149.TaskDetailsCubit>(
      () => _i149.TaskDetailsCubit(
        gh<_i813.LoadTaskUseCase>(),
        gh<_i914.CreateTaskUseCase>(),
        gh<_i214.UpdateTaskUseCase>(),
        gh<_i232.DeleteTaskUseCase>(),
      ),
    );
    return this;
  }
}

class _$LdvHttpClientModule extends _i755.LdvHttpClientModule {}

class _$TaskDependencyInjectionModule
    extends _i598.TaskDependencyInjectionModule {}

class _$CategoryDependencyInjectionModule
    extends _i598.CategoryDependencyInjectionModule {}
