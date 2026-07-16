import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/update_maintenance_item_port.dart';

@injectable
class UpdateMaintenanceItemUseCase {
  const UpdateMaintenanceItemUseCase(this._port);

  final UpdateMaintenanceItemPort _port;

  Future<void> call() async {}
}
