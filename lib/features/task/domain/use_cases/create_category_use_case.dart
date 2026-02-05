import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/category_repository.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';

@injectable
class CreateCategoryUseCase {
  const CreateCategoryUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<List<Category>> call({
    required String name,
    required Branch branch,
  }) async {
    final categories = await _categoryRepository.createCategory(
      name: name,
      branch: branch,
    );

    categories.sort((a, b) => a.name.compareTo(b.name));

    return categories;
  }
}
