// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'LDV App';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get tasks => 'Aufgaben';

  @override
  String get maintenance => 'Wartung';

  @override
  String get weddings => 'Hochzeiten';

  @override
  String get park => 'Park';

  @override
  String get mill => 'Mühle';

  @override
  String get theater => 'Theater';

  @override
  String get error =>
      'Ein Fehler ist aufgetreten. Bitte versuche es später noch einmal.';
}
