import 'package:dartz/dartz.dart';
import 'package:sakin_lyrics_app/app/domain/entities/artist_entity.dart';
import 'package:sakin_lyrics_app/core/error/failure.dart';

abstract class ArtistRepository {
  Future<Either<Failure, ArtistEntity>> fetchArtist(String id);
  Future<Either<Failure, ArtistEntity>> fetchMockArtist();
}
