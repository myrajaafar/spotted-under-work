// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:spotted/screens/others_Profile.dart';
import 'const/NavBar.dart';
import 'const/playlistcontent.dart';

class Playlist {
  final String name;
  final String cover;

  Playlist({required this.name, required this.cover});
}

class OSongList extends StatefulWidget {
  final List<Song> songs;
  final ThemeData theme;

  const OSongList({super.key, required this.songs, required this.theme});

  @override
  _OSongListState createState() => _OSongListState();
}

class _OSongListState extends State<OSongList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.songs.length,
        itemBuilder: (context, index) {
          final song = widget.songs[index];
          return ListTile(
            leading: Image.asset(
              song.cover,
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            title: Text(
              song.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            subtitle: Text(
              song.artist,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          );
        },
      ),
    );
  }
}

class OPlaylistBody extends StatefulWidget {
  final String playlistName;
  final String cover;
  final String about;
  final List<Song> songList;
  final ThemeData theme;

  const OPlaylistBody({
    super.key,
    required this.playlistName,
    required this.cover,
    required this.about,
    required this.songList,
    required this.theme,
  });

  @override
  _OPlaylistBody createState() => _OPlaylistBody();
}

class _OPlaylistBody extends State<OPlaylistBody> {
  List<Playlist> playlists = [
    Playlist(name: 'Playlist 1', cover: 'lib/images/bigcover.png'),
    Playlist(name: 'Playlist 2', cover: 'lib/images/bigcover.png'),
    // Add more playlists as needed
  ];
  List<Song> songs = List<Song>.generate(
    10,
    (index) => Song(
      title: 'Song ${index + 1}',
      artist: 'Artist ${index + 1}',
      cover: 'lib/images/bigcover.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
        header: widget.playlistName,
        page: OthersPlaylistscreen(
          theme: Theme.of(context),
        ),
        theme: Theme.of(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Image.asset(
                    widget.cover,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Shared clicked');
                      // Handle the click event for 'Shared'
                    },
                    child: Text(
                      'Shared',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).colorScheme.primary,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Divider(
                    thickness: 1,
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      widget.about,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  ),
                  OSongList(
                    songs: widget.songList,
                    theme: widget.theme,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OthersPlaylistscreen extends StatefulWidget {
  final ThemeData theme;

  const OthersPlaylistscreen({super.key, required this.theme});

  @override
  _OthersPlaylistscreenState createState() => _OthersPlaylistscreenState();
}

class _OthersPlaylistscreenState extends State<OthersPlaylistscreen> {
  final List<Playlist> playlists = [
    Playlist(name: 'Playlist 1', cover: 'lib/images/bigcover.png'),
    Playlist(name: 'Playlist 2', cover: 'lib/images/bigcover.png'),
    // Add more playlists as needed
  ];
  final List<Song> songs = List<Song>.generate(
    10,
    (index) => Song(
      title: 'Song ${index + 1}',
      artist: 'Artist ${index + 1}',
      cover: 'lib/images/bigcover.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
        header: 'Playlists',
        page: OthersProfileScreen(username: 'me'),
        theme: widget.theme,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            OthersPlayLists(
              playlists: playlists,
              songs: songs,
              theme: widget.theme,
            ),
          ],
        ),
      ),
    );
  }
}

class OthersPlayLists extends StatefulWidget {
  final List<Playlist> playlists;
  final List<Song> songs;
  final ThemeData theme;

  const OthersPlayLists({
    super.key,
    required this.playlists,
    required this.songs,
    required this.theme,
  });

  @override
  _OthersPlayListsState createState() => _OthersPlayListsState();
}

class _OthersPlayListsState extends State<OthersPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var playlist in widget.playlists)
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(playlist.cover),
              radius: MediaQuery.of(context).size.width * 0.1,
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OPlaylistBody(
                      playlistName: playlist.name,
                      cover: playlist.cover,
                      about: 'This is a playlist about ${playlist.name}',
                      songList: widget.songs,
                      theme: widget.theme,
                    ),
                  ),
                );
              },
              child: Text(
                playlist.name.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
