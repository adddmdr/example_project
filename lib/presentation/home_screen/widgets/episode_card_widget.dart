import 'package:example_project/core/constants/app_spacing.dart';
import 'package:example_project/domain/models/episode_model.dart';
import 'package:example_project/presentation/home_screen/widgets/episode_image.dart';
import 'package:flutter/material.dart';

/// [EpisodeCard] - Represents a card used for a single episode
class EpisodeCard extends StatelessWidget {
  final EpisodeModel episode;
  final bool isLast;

  const EpisodeCard({
    super.key,
    required this.episode,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = _episodeArtworkUrl(episode.id);

    return Padding(
      padding:
          isLast ? EdgeInsets.zero : EdgeInsets.only(bottom: AppSpacing.xl),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EpisodeImage(imageUrl: imageUrl),
              Padding(
                padding: EdgeInsets.all(AppSpacing.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.episode,
                      style: theme.textTheme.labelMedium,
                    ),
                    Text(
                      episode.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _episodeArtworkUrl(int episodeId) {
  return 'https://rickandmortyapi.com/api/character/avatar/$episodeId.jpeg';
}
