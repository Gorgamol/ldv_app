import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/core/utils/base_status.dart';
import 'package:ldv_app/features/appointment/domain/models/appointment.dart';

part 'appointment_state.freezed.dart';

@freezed
abstract class AppointmentState with _$AppointmentState {
  const factory AppointmentState({
    @Default(BaseStatus.init) BaseStatus status,
    @Default([]) List<Appointment> appointments,

    String? error,
  }) = _AppointmentState;
}
