import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/injection/injection.dart';
import 'package:ldv_app/features/appointment/adapter/out/appointment_http_adapter.dart';
import 'package:ldv_app/features/appointment/domain/interfaces/fetch_appointments_port.dart';

@module
abstract class AppointmentDependencyInjectionModule {
  FetchAppointmentsPort get fetchAppointmentsPort {
    return getIt<AppointmentHttpAdapter>();
  }
}
