import 'package:get/get.dart';
import 'package:tarali/home.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/splash/splash_screen.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => const Dashboard(),
    ),
  ];
}
