import 'package:example_project/application/home_screen/home_screen_cubit.dart';
import 'package:example_project/application/home_screen/home_screen_state.dart';
import 'package:example_project/domain/models/episode_model.dart';
import 'package:example_project/presentation/home_screen/widgets/episode_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Presents the home screen, reacting to [HomeScreenCubit] state changes.
/// Showslist of episodes when data loads successfully or when loading, are empty or there's an error

class HomeScreenContentView extends StatelessWidget {
  const HomeScreenContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) => switch (state) {
                  HomeScreenInitialState() => const SizedBox.shrink(),
                  HomeScreenLoadingState() => _HomeScreenLoadingView(),
                  HomeScreenLoadedState(episodes: final episodes) =>
                    _HomeScreenLoadedView(episodes: episodes),
                  HomeScreenLoadedEmptyState() => _HomeScreenLoadedEmptyView(),
                  HomeScreenErrorState() => _HomeScreenErrorView(),
                }),
      ),
    );
  }
}

class _HomeScreenLoadingView extends StatelessWidget {
  const _HomeScreenLoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator.adaptive());
  }
}

class _HomeScreenLoadedView extends StatelessWidget {
  final List<EpisodeModel> episodes;

  const _HomeScreenLoadedView({
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeScreenCubit>().getEpisodes(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: episodes.length,
          itemBuilder: (context, index) => EpisodeCard(
            episode: episodes[index],
            isLast: index == episodes.length - 1,
          ),
        ),
      ),
    );
  }
}

class _HomeScreenErrorView extends StatelessWidget {
  const _HomeScreenErrorView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Something went wrong.'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.read<HomeScreenCubit>().getEpisodes(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class _HomeScreenLoadedEmptyView extends StatelessWidget {
  const _HomeScreenLoadedEmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No episodes available right now.'),
    );
  }
}
