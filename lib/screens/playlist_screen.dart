// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'const/playlistContent.dart';
import 'playlists.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen>{
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
    return PlaylistBody(
      playlistName: widget.playlist.name,
      cover: widget.playlist.cover,
      about: 'baby i got a plan run away as fast as you can',
      songList: songs,
    );
  }
}