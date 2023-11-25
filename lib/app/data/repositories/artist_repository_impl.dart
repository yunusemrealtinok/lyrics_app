import 'package:dartz/dartz.dart';
import 'package:sakin_lyrics_app/app/data/datasources/artist_data_source.dart';
import 'package:sakin_lyrics_app/app/domain/entities/artist_entity.dart';
import 'package:sakin_lyrics_app/app/domain/repositories/artist_repository.dart';
import 'package:sakin_lyrics_app/core/error/exception.dart';
import 'package:sakin_lyrics_app/core/error/failure.dart';

class ArtistRepositoryImpl implements ArtistRepository {
  ArtistDataSource artistDataSource = ArtistDataSourceImpl();

  @override
  Future<Either<Failure, ArtistEntity>> fetchArtist(String id) async {
    try {
      final artistModel = await artistDataSource.fetchArtist(id);
      return Right(artistModel);
    } catch (e) {
      return Left(ArtistFailure());
    }
  }

  @override
  Future<Either<Failure, ArtistEntity>> fetchMockArtist() async {
    try {
      final artistModel = await artistDataSource.fetchMockArtist();
      return Right(artistModel);
    } catch (e) {
      return Left(ArtistFailure());
    }
  }
}
