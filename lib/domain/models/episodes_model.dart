import 'package:example_project/domain/models/episode_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episodes_model.g.dart';

@JsonSerializable()
class EpisodesModel {
  @JsonKey(name: 'results')
  final List<EpisodeModel> episodes;

  const EpisodesModel({
    required this.episodes,
  });

  factory EpisodesModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesModelToJson(this);
}
