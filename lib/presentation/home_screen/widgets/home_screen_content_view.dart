import 'package:example_project/application/home_screen/home_screen_cubit.dart';
import 'package:example_project/application/home_screen/home_screen_state.dart';
import 'package:example_project/core/constants/app_spacing.dart';
import 'package:example_project/domain/models/episode_model.dart';
import 'package:example_project/presentation/home_screen/widgets/episode_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Presents the home screen, reacting to [HomeScreenCubit] state changes.
/// Shows a list of episodes when data loads successfully, plus explicit loading, empty, and error states.

class HomeScreenContentView extends StatelessWidget {
  const HomeScreenContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) => switch (state) {
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
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.l,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.l),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: episodes.length,
        itemBuilder: (context, index) => EpisodeCard(
          episode: episodes[index],
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
          const SizedBox(height: AppSpacing.m),
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
