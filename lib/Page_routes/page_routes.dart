import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/homepage/homepage.dart';

class MyappRoutes {
  static const String homeRoutesName = 'home';

  GoRouter router = GoRouter(routes: [
    GoRoute(
        name: homeRoutesName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Homepage());
        })
  ]);
}
