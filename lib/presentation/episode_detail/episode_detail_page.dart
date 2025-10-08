import 'package:example_project/domain/models/episode_model.dart';
import 'package:flutter/material.dart';

/// Detail screen of a specific epsiode
class EpisodeDetailPage extends StatelessWidget {
  const EpisodeDetailPage({
    super.key,
    required this.episode,
  });

  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode #${episode.id}'),
      ),
      body: Center(
        child: Text(
          episode.name,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
