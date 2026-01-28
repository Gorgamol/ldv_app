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
import 'package:ldv_app/features/task/adapter/in/edit_task_cubit.dart' as _i612;
import 'package:ldv_app/features/task/adapter/in/task_cubit.dart' as _i1040;
import 'package:ldv_app/features/task/adapter/out/task_http_adapter.dart'
    as _i915;
import 'package:ldv_app/features/task/di.dart' as _i598;
import 'package:ldv_app/features/task/domain/interfaces/task_repository.dart'
    as _i555;
import 'package:ldv_app/features/task/domain/use_cases/create_task_use_case.dart'
    as _i914;
import 'package:ldv_app/features/task/domain/use_cases/load_all_tasks_use_case.dart'
    as _i279;
import 'package:ldv_app/features/task/domain/use_cases/load_task_use_case.dart'
    as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final ldvHttpClientModule = _$LdvHttpClientModule();
    final taskDependencyInjectionModule = _$TaskDependencyInjectionModule();
    gh.factory<_i755.LdvHttpClient>(() => ldvHttpClientModule.getHttpClient());
    gh.factory<_i555.TaskRepository>(
      () => taskDependencyInjectionModule.taskRepository,
    );
    gh.lazySingleton<_i999.BranchCubit>(() => _i999.BranchCubit());
    gh.factory<_i915.TaskHttpAdapter>(
      () => _i915.TaskHttpAdapter(gh<_i755.LdvHttpClient>()),
    );
    gh.factory<_i914.CreateTaskUseCase>(
      () => _i914.CreateTaskUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i279.LoadAllTasksUseCase>(
      () => _i279.LoadAllTasksUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i813.LoadTaskUseCase>(
      () => _i813.LoadTaskUseCase(gh<_i555.TaskRepository>()),
    );
    gh.factory<_i612.EditTaskCubit>(
      () => _i612.EditTaskCubit(gh<_i914.CreateTaskUseCase>()),
    );
    gh.factory<_i1040.TaskCubit>(
      () => _i1040.TaskCubit(gh<_i279.LoadAllTasksUseCase>()),
    );
    return this;
  }
}

class _$LdvHttpClientModule extends _i755.LdvHttpClientModule {}

class _$TaskDependencyInjectionModule
    extends _i598.TaskDependencyInjectionModule {}
