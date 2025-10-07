import 'package:example_project/presentation/home_screen/page/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return HomeScreenPage();
    },
  ),
]);
