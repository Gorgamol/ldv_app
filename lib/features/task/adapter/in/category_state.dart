import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/utils/base_status.dart';
import 'package:ldv_app/features/task/domain/models/category.dart';
part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(BaseStatus.init) BaseStatus status,
    @Default([]) List<Category> categories,
    String? error,
  }) = _CategoryState;
}
