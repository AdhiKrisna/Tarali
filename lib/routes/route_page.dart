import 'package:get/get.dart';
import 'package:tarali/views/pages/dashboard_page.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/pages/splash_page.dart';
import 'package:tarali/views/pages/history_pages/history_page.dart';
import 'package:tarali/views/pages/history_pages/detail_history_page.dart';
import 'package:tarali/views/pages/scoring_pages/to_scoring_page.dart';
import 'package:tarali/views/pages/scoring_pages/detail_to_scoring_page.dart';
import 'package:tarali/views/pages/scoring_pages/scoring_page.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => const DashboardPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.history,
      page: () => const HistoryPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.detailHistory,
      page: () => const DetailHistoryPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),

    //teacher's pages
    GetPage(
      name: RouteName.toScoringPage,
      page: () => const ToScoringPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.detailToScoringPage,
      page: () => const DetailToScoringPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.scoringPage,
      page: () => const ScoringPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
