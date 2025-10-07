import 'package:example_project/application/home_screen/home_screen_cubit.dart';
import 'package:example_project/application/home_screen/home_screen_state.dart';
import 'package:example_project/domain/models/episode_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenContentView extends StatelessWidget {
  const HomeScreenContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) => switch (state) {
          HomeScreenLoadedState(episodes: final episodes) =>
            HomeScreenLoadedStateView(
              episodes: episodes,
            ),
          (_) => Center(child: CircularProgressIndicator())
        },
      ),
    );
  }
}

class HomeScreenLoadedStateView extends StatelessWidget {
  final List<EpisodeModel> episodes;
  const HomeScreenLoadedStateView({
    super.key,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          episodes[index].name,
        ),
      ),
    );
  }
}
