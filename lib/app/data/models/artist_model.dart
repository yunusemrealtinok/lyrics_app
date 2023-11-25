import 'package:sakin_lyrics_app/app/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity {
  ArtistModel(
      {required this.name, required this.songName, required this.lyrics})
      : super(name: name, songName: songName, lyrics: lyrics);
  final String name;
  final String songName;
  final String lyrics;
  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      name: json['artist'],
      songName: json['song'],
      lyrics: json['lyrics_excerpt'],
    );
  }
}
