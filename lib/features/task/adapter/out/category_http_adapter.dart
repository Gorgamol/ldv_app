import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/api/dtos/category_dto.dart';
import 'package:ldv_app/core/api/ldv_http_client.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/category_repository.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';

@injectable
class CategoryHttpAdapter implements CategoryRepository {
  CategoryHttpAdapter(this._client);

  final LdvHttpClient _client;

  @override
  Future<List<Category>> fetchCategories({required Branch branch}) async {
    final categoryDtos = await _client.getCategories(branch: branch);

    return categoryDtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<List<Category>> createCategory({
    required String name,
    required Branch branch,
  }) async {
    final categoryDtos = await _client.createCategory(
      body: {'name': name, 'branch': branch},
    );

    return categoryDtos.map((dto) => dto.toDomain()).toList();
  }
}

extension _CategoryDtoExtension on CategoryDto {
  Category toDomain() {
    return Category(id: id.toString(), name: name);
  }
}
