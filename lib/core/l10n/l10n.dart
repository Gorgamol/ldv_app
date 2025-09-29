import 'package:ldv_app/core/l10n/app_localizations.dart';
import 'package:ldv_app/core/routing/ldv_app_router.dart';

class L10n {
  static AppLocalizations get current {
    return AppLocalizations.of(navigatorKey.currentContext!)!;
  }
}
