// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/update/update_v.dart';
import 'package:stacked/stacked.dart';


import '../ui/views/login/login_v.dart';
import '../ui/views/splash/splash_v.dart';

class Routes {
  static const String splashScreenV = '/';
  static const String homeScreenV = '/home-screen-v';
  static const String loginView = '/login-view';
  static const all = <String>{
    splashScreenV,
    homeScreenV,
    loginView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenV, page: SplashScreenV),
    RouteDef(Routes.homeScreenV, page: UpdateScreenV),
    RouteDef(Routes.loginView, page: LoginView),
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
    UpdateScreenV: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UpdateScreenV(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
  };
}
