import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_image.dart';

part 'maintenance_update.freezed.dart';

@freezed
abstract class MaintenanceUpdate with _$MaintenanceUpdate {
  const factory MaintenanceUpdate({
    @Default(null) DateTime? createdAt,
    @Default('') String description,
    @Default('') String author,
    @Default([]) List<MaintenanceImage> images,
  }) = _MaintenanceUpdate;
}
