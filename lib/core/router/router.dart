import 'package:example_project/domain/models/episode_model.dart';
import 'package:example_project/presentation/episode_detail/episode_detail_page.dart';
import 'package:example_project/presentation/home_screen/page/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreenPage();
      },
      routes: [
        GoRoute(
          path: 'episode/:id',
          builder: (BuildContext context, GoRouterState state) {
            final episode = state.extra as EpisodeModel;

            return EpisodeDetailPage(
              episode: episode,
            );
          },
        ),
      ],
    ),
  ],
);
