import 'package:ldv_app/core/l10n/l10n.dart';

enum ClubBranch {
  park,
  mill,
  theater;

  @override
  String toString() => switch (this) {
    park => L10n.current.clubBranchPark,
    mill => L10n.current.clubBranchMill,
    theater => L10n.current.clubBranchTheater,
  };
}
