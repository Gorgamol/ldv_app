import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/appointment/adapter/in/appointment_state.dart';
import 'package:ldv_app/features/appointment/domain/use_cases/load_appointments_use_case.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

@injectable
class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._loadAppointmentsUseCase)
    : super(const AppointmentState());

  final LoadAppointmentsUseCase _loadAppointmentsUseCase;

  Future<void> loadAppointments({Branch? branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      final appointments = await _loadAppointmentsUseCase(branch: branch);

      emit(state.copyWith(status: .success, appointments: appointments));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.translate.error));
    }
  }
}
