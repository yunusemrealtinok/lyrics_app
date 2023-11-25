import 'package:get/get.dart';
import 'package:sakin_lyrics_app/app/data/models/artist_model.dart';
import 'package:sakin_lyrics_app/app/data/datasources/artist_data_source.dart';
import 'package:sakin_lyrics_app/app/data/repositories/artist_repository_impl.dart';
import 'package:sakin_lyrics_app/app/domain/entities/artist_entity.dart';
import 'package:sakin_lyrics_app/app/domain/repositories/artist_repository.dart';

import '../../../data/mock_lyrics.dart';

class HomeController extends GetxController {
  ArtistRepository artistRepository = ArtistRepositoryImpl();
  Rx<ArtistEntity?> artist = ArtistEntity(
    name: 'Sakin',
    songName: 'Edepsiz Komedya',
    lyrics: 'sadfsdg',
  ).obs;
  final List<String> items = artistMap.keys.toList();

  RxString selectedValue = artistMap.keys.first.obs;

  Future<void> setSelectedValue(String value) async {
    selectedValue.value = value;

    artistRepository
        .fetchArtist(artistMap[value]!)
        .then((value) => value.fold((l) => null, (r) => artist.value = r));
  }

  Future<void> refreshArtist() async {
    artistRepository
        .fetchArtist(artistMap[selectedValue.value]!)
        .then((value) => value.fold((l) => null, (r) => artist.value = r));
  }

  @override
  void onInit() async {
    artistRepository
        .fetchMockArtist()
        .then((value) => value.fold((l) => null, (r) => artist.value = r));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
