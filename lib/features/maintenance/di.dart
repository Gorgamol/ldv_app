import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/features/maintenance/adapter/out/maintenance_http_adapter.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/fetch_maintenance_items_port.dart';

@module
abstract class MaintenanceDependencyInjectionModule {
  FetchMaintenanceItemsPort get fetchMaintenanceItemsPort {
    return getIt<MaintenanceHttpAdapter>();
  }
}
