class Artist {
  String id;
  final String name;

  Artist({
    this.id = '',
    required this.name,
  });

  static List<Artist> artists = [
    Artist(id: '1', name: 'Justin Bieber'),
    Artist(id: '2', name: 'Selena Gomez'),
    Artist(id: '3', name: 'Dua Lipa'),
    Artist(id: '4', name: 'Katy Perry'),
    Artist(id: '5', name: 'Ariana Grande'),
  ];
}
