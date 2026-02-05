import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'branch') required String branch,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, Object?> json) =>
      _$CategoryDtoFromJson(json);
}
