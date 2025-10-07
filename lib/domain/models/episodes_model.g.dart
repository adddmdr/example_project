// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_model.dart';

EpisodesModel _$EpisodesModelFromJson(Map<String, dynamic> json) =>
    EpisodesModel(
      episodes: (json['results'] as List<dynamic>)
          .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodesModelToJson(EpisodesModel instance) =>
    <String, dynamic>{
      'results': instance.episodes.map((e) => e.toJson()).toList(),
    };
