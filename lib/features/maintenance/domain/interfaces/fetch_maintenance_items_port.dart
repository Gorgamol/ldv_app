import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_item.dart';

abstract interface class FetchMaintenanceItemsPort {
  Future<List<MaintenanceItem>> fetchData({required Branch branch});
}
