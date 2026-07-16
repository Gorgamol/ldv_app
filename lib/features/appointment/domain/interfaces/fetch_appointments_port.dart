import 'package:ldv_app/features/appointment/domain/models/appointment.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

abstract interface class FetchAppointmentsPort {
  Future<List<Appointment>> fetchData({required Branch? branch});
}
