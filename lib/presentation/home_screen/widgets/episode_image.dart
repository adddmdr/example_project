import 'package:flutter/material.dart';

class EpisodeImage extends StatelessWidget {
  final String? imageUrl;

  const EpisodeImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl != null)
            Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator.adaptive();
              },
              errorBuilder: (_, __, ___) => const _EpisodeImageFallback(),
            )
          else
            const _EpisodeImageFallback(),
        ],
      ),
    );
  }
}

class _EpisodeImageFallback extends StatelessWidget {
  const _EpisodeImageFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(
          Icons.movie_filter_rounded,
          size: 56,
          color: Colors.black38,
        ),
      ),
    );
  }
}
