import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/homepage/homepage.dart';

class MyappRoutes {
  static const String homeRoutesName = 'home';
  static const String qrscanname = 'qrscan';

  GoRouter router = GoRouter(routes: [
    // GoRoute(
    //     name: qrscanname,
    //     path: '/qrscan',
    //     pageBuilder: (context, state) {
    //       return const MaterialPage(child: ());
    //     }),
    GoRoute(
        name: homeRoutesName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Homepage());
        })
  ]);
}
