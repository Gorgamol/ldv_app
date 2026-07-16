import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/utils/base_status.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_item.dart';

part 'maintenance_overview_state.freezed.dart';

@freezed
abstract class MaintenanceOverviewState with _$MaintenanceOverviewState {
  const factory MaintenanceOverviewState({
    @Default(BaseStatus.init) BaseStatus status,
    @Default([]) List<MaintenanceItem> items,
    String? error,
  }) = _MaintenanceOverviewState;
}
