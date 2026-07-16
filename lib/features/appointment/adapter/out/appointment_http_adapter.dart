import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/appointment/domain/interfaces/fetch_appointments_port.dart';
import 'package:ldv_app/features/appointment/domain/models/appointment.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

@injectable
class AppointmentHttpAdapter implements FetchAppointmentsPort {
  const AppointmentHttpAdapter();

  @override
  Future<List<Appointment>> fetchData({required Branch? branch}) async {
    return switch (branch) {
      .mill => _millAppointments,
      .theater => _theaterAppointments,
      .park => _parkAppointments,
      .baking => _bakingAppointments,
      _ => [
        ..._millAppointments,
        ..._theaterAppointments,
        ..._parkAppointments,
        ..._bakingAppointments,
      ],
    };
  }
}

final _millAppointments = <Appointment>[
  Appointment(
    title: 'Boßeln und Kohlessen',
    start: DateTime.parse('2026-03-14 14:00:00'),
    end: DateTime.parse('2026-03-14 18:00:00'),
    branch: Branch.mill,
  ),
  Appointment(
    title: 'Jahreshauptversammlung',
    start: DateTime.parse('2026-03-21 15:00:00'),
    end: DateTime.parse('2026-03-21 18:00:00'),
    branch: Branch.mill,
  ),
  Appointment(
    title: 'Spieleabend Mühle',
    start: DateTime.parse('2026-03-26 18:00:00'),
    end: DateTime.parse('2026-03-26 20:00:00'),
    branch: Branch.mill,
  ),
];

final _parkAppointments = <Appointment>[
  Appointment(
    title: 'Arbeitsdienst - Park',
    start: DateTime.parse('2026-03-14 09:00:00'),
    end: DateTime.parse('2026-03-14 12:00:00'),
    branch: Branch.park,
  ),
  Appointment(
    title: 'Vathouse - Band',
    start: DateTime.parse('2026-05-30 20:00:00'),
    end: DateTime.parse('2026-05-30 22:00:00'),
    branch: Branch.park,
  ),
];

final _theaterAppointments = <Appointment>[
  Appointment(
    title: 'Aufführung Generalprobe',
    start: DateTime.parse('2026-10-15 20:00:00'),
    end: DateTime.parse('2026-10-15 22:00:00'),
    branch: Branch.theater,
  ),
  Appointment(
    title: 'Aufführung Premiere',
    start: DateTime.parse('2026-10-16 20:00:00'),
    end: DateTime.parse('2026-10-16 22:00:00'),
    branch: Branch.theater,
  ),
  Appointment(
    title: 'Aufführung',
    start: DateTime.parse('2026-10-18 20:00:00'),
    end: DateTime.parse('2026-10-18 22:00:00'),
    branch: Branch.theater,
  ),
  Appointment(
    title: 'Aufführung',
    start: DateTime.parse('2026-10-23 20:00:00'),
    end: DateTime.parse('2026-10-23 22:00:00'),
    branch: Branch.theater,
  ),
  Appointment(
    title: 'Aufführung',
    start: DateTime.parse('2026-10-24 20:00:00'),
    end: DateTime.parse('2026-10-24 22:00:00'),
    branch: Branch.theater,
  ),
  Appointment(
    title: 'Aufführung',
    start: DateTime.parse('2026-10-25 15:00:00'),
    end: DateTime.parse('2026-10-25 18:00:00'),
    branch: Branch.theater,
  ),
];

final _bakingAppointments = <Appointment>[];
