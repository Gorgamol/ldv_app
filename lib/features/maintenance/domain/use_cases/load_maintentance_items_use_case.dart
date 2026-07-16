import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/fetch_maintenance_items_port.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_item.dart';

@injectable
class LoadMaintentanceItemsUseCase {
  const LoadMaintentanceItemsUseCase(this._port);

  final FetchMaintenanceItemsPort _port;

  Future<List<MaintenanceItem>> call({required Branch branch}) async {
    return await _port.fetchData(branch: branch);
  }
}
