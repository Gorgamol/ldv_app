import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/interfaces/category_repository.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';

@injectable
class LoadCategoriesUseCase {
  const LoadCategoriesUseCase(this._categoryRepository);

  final CategoryRepository _categoryRepository;

  Future<List<Category>> call({required Branch branch}) async {
    final categories = await _categoryRepository.fetchCategories(
      branch: branch,
    );

    categories.sort((a, b) => a.name.compareTo(b.name));

    return categories;
  }
}
