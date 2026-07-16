import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/maintenance/domain/interfaces/create_maintenance_item_port.dart';

@injectable
class CreateMaintenanceItemUseCase {
  const CreateMaintenanceItemUseCase(this._port);

  final CreateMaintenanceItemPort _port;

  Future<void> call() async {}
}
