import 'package:get/get.dart';
import 'package:tarali/views/pages/dashboard_page.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/pages/splash_page.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => const DashboardPage(),
    ),
  ];
}
