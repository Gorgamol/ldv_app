import 'package:ldv_app/core/l10n/l10n.dart';

enum Branch {
  park,
  mill,
  theater,
  baking,
  unknown;

  @override
  String toString() => switch (this) {
    park => 'park',
    mill => 'mill',
    theater => 'theater',
    baking => 'baking',
    _ => 'unknown',
  };

  String toL10nString() => switch (this) {
    park => L10n.translate.park,
    mill => L10n.translate.mill,
    theater => L10n.translate.theater,
    baking => 'Brotbackgruppe',
    _ => L10n.translate.unknown,
  };

  String asAsset() => switch (this) {
    park => 'assets/images/logo_park.png',
    mill => 'assets/images/logo_mill.png',
    theater => 'assets/images/logo_theater.png',
    baking => 'assets/images/logo_baking.png',
    _ => 'assets/images/logo_ldv.png',
  };

  static Branch fromString({required String value}) {
    return switch (value) {
      'park' => park,
      'mill' => mill,
      'theater' => theater,
      'baking' => baking,
      _ => unknown,
    };
  }
}
