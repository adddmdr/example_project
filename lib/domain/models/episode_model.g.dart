// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      airDate: json['air_date'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      created: json['created'] as String,
      episode: json['episode'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'characters': instance.characters,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };
