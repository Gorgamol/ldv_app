import 'package:go_router/go_router.dart';
import 'package:ldv_app/ui/splash/splash_page.dart';

final ldvAppRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const SplashPage())],
);
