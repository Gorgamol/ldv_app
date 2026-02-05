import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';

abstract interface class CategoryRepository {
  Future<List<Category>> fetchCategories({required Branch branch});

  Future<List<Category>> createCategory({
    required String name,
    required Branch branch,
  });
}
