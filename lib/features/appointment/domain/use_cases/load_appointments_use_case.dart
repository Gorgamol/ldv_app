import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/appointment/domain/interfaces/fetch_appointments_port.dart';
import 'package:ldv_app/features/appointment/domain/models/appointment.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

@injectable
class LoadAppointmentsUseCase {
  const LoadAppointmentsUseCase(this._fetchAppointmentsPort);

  final FetchAppointmentsPort _fetchAppointmentsPort;

  Future<List<Appointment>> call({required Branch? branch}) async {
    final appointments = await _fetchAppointmentsPort.fetchData(branch: branch);

    appointments.sort((a, b) => a.start.compareTo(b.start));

    return appointments;
  }
}
