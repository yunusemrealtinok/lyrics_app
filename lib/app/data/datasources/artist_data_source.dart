import 'package:dio/dio.dart';
import 'package:sakin_lyrics_app/app/data/mock_lyrics.dart';
import 'package:sakin_lyrics_app/core/error/exception.dart';

import '../models/artist_model.dart';

abstract class ArtistDataSource {
  Future<ArtistModel> fetchMockArtist();

  Future<ArtistModel> fetchArtist(String id);
}

class ArtistDataSourceImpl implements ArtistDataSource {
  final Dio dio = Dio();

  @override
  Future<ArtistModel> fetchMockArtist() async {
    return _fetchMockArtist();
  }

  @override
  Future<ArtistModel> fetchArtist(String id) async {
    return _fetchArtist(id);
  }

  Future<ArtistModel> _fetchMockArtist() async {
    return ArtistModel.fromJson(response);
  }

  Future<ArtistModel> _fetchArtist(String id) async {
    try {
      String baseUrl =
          'https://songsexcerpt.mohd.app/api/v1/getRandomExcerpt?artists=';
      final response = await dio.get(baseUrl + id);
      final result = response.data;
      return ArtistModel.fromJson(result);
    } catch (e) {
      throw ArtistException();
    }
  }
}
