// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/dashboard/dashboard_vd.dart';
import '../ui/views/home/home_vd.dart';
import '../ui/views/login/login_v.dart';
import '../ui/views/main_spalsh/main_splash.dart';
import '../ui/views/splash/splash_v.dart';

class Routes {
  static const String splashScreenV = '/splash-screen-v';
  static const String loginView = '/login-view';
  static const String homeScreenV = '/home-screen-v';
  static const String dashBoard = '/dash-board';
  static const String mainSplashScreen = '/';
  static const all = <String>{
    splashScreenV,
    loginView,
    homeScreenV,
    dashBoard,
    mainSplashScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenV, page: SplashScreenV),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeScreenV, page: HomeScreenV),
    RouteDef(Routes.dashBoard, page: DashBoard),
    RouteDef(Routes.mainSplashScreen, page: MainSplashScreen),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreenV: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenV(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    HomeScreenV: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreenV(),
        settings: data,
      );
    },
    DashBoard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashBoard(),
        settings: data,
      );
    },
    MainSplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainSplashScreen(),
        settings: data,
      );
    },
  };
}
