import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/task/adapter/in/category_state.dart';
import 'package:ldv_app/features/task/domain/use_cases/create_category_use_case.dart';
import 'package:ldv_app/features/task/domain/use_cases/load_categories_use_case.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._loadCategoriesUseCase, this._createCategoryUseCase)
    : super(const CategoryState());

  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final CreateCategoryUseCase _createCategoryUseCase;

  Future<void> loadCategories({required Branch branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      final categories = await _loadCategoriesUseCase(branch: branch);

      emit(state.copyWith(status: .success, categories: categories));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }

  Future<void> addCategory({
    required String name,
    required Branch branch,
  }) async {
    emit(state.copyWith(status: .loading));

    try {
      final categories = await _createCategoryUseCase(
        name: name,
        branch: branch,
      );

      emit(state.copyWith(status: .success, categories: categories));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.current.error));
    }
  }
}
