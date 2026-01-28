import 'package:ldv_app/core/l10n/l10n.dart';

enum Branch {
  park,
  mill,
  theater,
  unknown;

  @override
  String toString() => switch (this) {
    park => 'park',
    mill => 'mill',
    theater => 'theater',
    _ => 'unknown',
  };

  String toL10nString() => switch (this) {
    park => L10n.current.park,
    mill => L10n.current.mill,
    theater => L10n.current.theater,
    _ => L10n.current.unknown,
  };

  static Branch fromString({required String value}) {
    return switch (value) {
      'park' => park,
      'mill' => mill,
      'theater' => theater,
      _ => unknown,
    };
  }
}
