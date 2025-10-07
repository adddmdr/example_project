import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  final int id;
  final String name;
  @JsonKey(name: 'air_date')
  final String airDate;
  final List<String> characters;
  final String episode;
  final String url;
  final String created;

  const EpisodeModel({
    required this.airDate,
    required this.characters,
    required this.created,
    required this.episode,
    required this.id,
    required this.name,
    required this.url,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
