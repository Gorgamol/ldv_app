import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

part 'appointment.freezed.dart';

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    @Default('') String title,
    required DateTime start,
    required DateTime end,
    @Default(Branch.unknown) Branch branch,
  }) = _Appointment;
}
