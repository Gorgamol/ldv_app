import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/api/dtos/task_dto.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

import 'package:retrofit/retrofit.dart';

part 'ldv_http_client.g.dart';

@RestApi(baseUrl: 'https://backend.larrelter-dorfverein.de/api/')
abstract class LdvHttpClient {
  factory LdvHttpClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _LdvHttpClient;

  @GET('/tasks')
  Future<List<TaskDto>> getTasksByBranch({
    @Query('branch') required Branch branch,
  });

  @POST('/tasks')
  Future<TaskDto> createTask({
    @Query('branch') required Branch branch,
    @Body() required TaskDto task,
  });

  @GET('/tasks/{id}')
  Future<TaskDto> getTask({@Path() required String id});

  @PATCH('/tasks/{id}')
  Future<void> updateTask({
    @Path() required String id,
    @Body() required TaskDto task,
  });

  @DELETE('/tasks/{id}')
  Future<void> deleteTask(@Path() String id);
}

@module
abstract class LdvHttpClientModule {
  LdvHttpClient getHttpClient() {
    final client = Dio(
      BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    return LdvHttpClient(client);
  }
}
