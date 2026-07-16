import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_image.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_update.dart';

part 'maintenance_item.freezed.dart';

@freezed
abstract class MaintenanceItem with _$MaintenanceItem {
  const factory MaintenanceItem({
    @Default('') String id,
    @Default(null) DateTime? createdAt,
    @Default(null) DateTime? updatedAt,
    @Default('') String title,
    @Default('') String description,
    @Default('') String author,
    @Default(null) MaintenanceImage? thumbnail,
    @Default([]) List<MaintenanceImage> images,
    @Default([]) List<MaintenanceUpdate> updates,
  }) = _MaintenanceItem;
}
