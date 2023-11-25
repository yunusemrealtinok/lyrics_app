import 'package:flutter/material.dart';
import 'package:sakin_lyrics_app/app/domain/entities/artist_entity.dart';

import '../../../data/models/artist_model.dart';

class LyricsCard extends StatelessWidget {
  final ArtistEntity artistEntity;
  final Function() refreshArtistEntity;
  const LyricsCard({
    super.key,
    required this.artistEntity,
    required this.refreshArtistEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: const Color(0xFF1ED760),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.teal.shade700,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Lyrics",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListTile(
                  title: Text(
                    artistEntity.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  subtitle: Text(
                    artistEntity.songName,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  artistEntity.lyrics,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: refreshArtistEntity,
                    child: const Icon(Icons.refresh),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
