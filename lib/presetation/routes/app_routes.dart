import 'package:app_pokmon/imports.dart';
import 'package:app_pokmon/presetation/home/home_page/app_home.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const AppSplash(),
    '/home': (context) => const AppHome()
  };
}
