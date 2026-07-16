import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_image.freezed.dart';

@freezed
abstract class MaintenanceImage with _$MaintenanceImage {
  const factory MaintenanceImage({
    @Default('') String url,
    @Default('') String title,
  }) = _MaintenanceImage;
}
