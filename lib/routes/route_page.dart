import 'package:get/get.dart';
import 'package:tarali/views/pages/auth/login_guru.dart';
import 'package:tarali/views/pages/auth/login_siswa_page.dart';
import 'package:tarali/views/pages/auth/register_guru.dart';
import 'package:tarali/views/pages/auth/register_siswa_page.dart';
import 'package:tarali/views/pages/dashboard_page.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/pages/detail/detail_page.dart';
import 'package:tarali/views/pages/splash_page.dart';
import 'package:tarali/views/pages/history/history_page.dart';
import 'package:tarali/views/pages/history/detail_history_page.dart';
import 'package:tarali/views/pages/scoring/to_scoring_page.dart';
import 'package:tarali/views/pages/scoring/detail_to_scoring_page.dart';
import 'package:tarali/views/pages/scoring/scoring_page.dart';

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

    //student's pages
    GetPage(
      name: RouteName.detailContentPage,
      page: () => const DetailPage(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),

    //auth pages
    GetPage(
      name: RouteName.loginSiswa, 
      page: () => const LoginSiswa(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),

    GetPage(
      name: RouteName.registerSiswa,
      page: () => const RegisterSiswa(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.loginGuru,
      page: () => const LoginGuru(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RouteName.registerGuru,
      page: () => const RegisterGuru(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 1000),
    )
  ];
}
