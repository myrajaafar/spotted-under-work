import 'package:spotted/models/artist.dart';

class Song {
  final String id;
  final Artist artist;
  final String title;
  final String imageUrl;
  final String? songPath;
  final String? songUrl;
  final bool isTrending;

  Song({
    this.id = '',
    required this.artist,
    required this.title,
    required this.imageUrl,
    this.songPath,
    this.songUrl,
    this.isTrending = true,
  }) : assert(songPath != null || songUrl != null);

  static List<Song> songs = [
    Song(
      artist: Artist(id: '1', name: 'Justin Bieber'),
      title: 'Peaches',
      imageUrl: 'lib/images/Screenshot 2024-04-24 033817.png',
      songPath: 'https://on.soundcloud.com/US8D1xcQKoUgVjGT7',
    ),
    Song(
      artist: Artist(id: '2', name: 'Selena Gomez'),
      title: 'Baila Conmigo',
      imageUrl: 'lib/images/Screenshot 2024-04-24 033817.png',
      songPath: 'https://on.soundcloud.com/PkZZL7AugaZyv3Kv7',
    ),
    Song(
      artist: Artist(id: '3', name: 'Dua Lipa'),
      title: 'Levitating',
      imageUrl: 'lib/images/Screenshot 2024-04-24 033817.png',
      songPath: 'https://on.soundcloud.com/6JRJ2dLtpTDuADbB6',
    ),
    Song(
      artist: Artist(id: '4', name: 'Katy Perry'),
      title: 'Dark Horse',
      imageUrl: 'lib/images/Screenshot 2024-04-24 033817.png',
      songPath: 'https://on.soundcloud.com/fZRDc8pkDX1dPBRG6',
    ),
    Song(
      artist: Artist(id: '5', name: 'Ariana Grande'),
      title: 'Positions',
      imageUrl: 'lib/images/Screenshot 2024-04-24 033817.png',
      songPath: 'https://on.soundcloud.com/dq6sGqBPwC5X3r218',
    ),
  ];
}
