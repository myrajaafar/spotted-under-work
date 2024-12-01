// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../core/constants/NavBar.dart';
import 'playlist_screen.dart';
import 'profile_screen.dart';
// Import the theme data from main.dart

class Playlistscreen extends StatefulWidget {
  const Playlistscreen({Key? key}) : super(key: key);

  @override
  _PlaylistscreenState createState() => _PlaylistscreenState();
}

class Playlist {
  final String name;
  final String cover;

  Playlist({required this.name, required this.cover});
}

class PlayLists extends StatefulWidget {
  final List<Playlist> playlists;
  final ThemeData theme; // Add theme property

  const PlayLists({Key? key, required this.playlists, required this.theme})
      : super(key: key);

  @override
  _PlayListsState createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
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
                    builder: (context) => PlaylistScreen(playlist: playlist),
                  ),
                ); // Implement your onTap logic here page here goes based on name
              },
              child: Text(
                playlist.name.toUpperCase(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: widget.theme.colorScheme
                      .primary, // Use primary color from the theme
                ),
              ),
            ),
            trailing: IconButton(
              icon: Image.asset(
                'lib/images/remove.png', // Replace this with your actual image path
                width: MediaQuery.of(context).size.width *
                    0.08, // Set the width of the image
                height: MediaQuery.of(context).size.width *
                    0.08, // Set the height of the image
              ),
              onPressed: () {
                setState(() {
                  widget.playlists.remove(playlist);
                });
              },
            ),
          ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.01), // Add this line
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListTile(
            leading: Image.asset(
              //change to svg and change according to accent/onbackground
              'lib/images/plus-circle-svgrepo-com 1.png',
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            title: Text(
              'Add Playlist',
              style: TextStyle(
                fontWeight:
                    FontWeight.bold, // Use the accent color from the theme
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: widget.theme.colorScheme
                    .primary, // Use primary color from the theme
              ),
            ),
            onTap: () {
              setState(() {
                widget.playlists.add(
                  Playlist(
                    name: 'heller',
                    cover: 'lib/images/Ellipse.png',
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}

class _PlaylistscreenState extends State<Playlistscreen> {
  final List<Playlist> playlists = [
    Playlist(name: 'Playlist 1', cover: 'lib/images/bigcover.png'),
    Playlist(name: 'Playlist 2', cover: 'lib/images/bigcover.png'),
    // Add more playlists as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
        header: 'Playlists',
        page: ProfileScreen(),
        theme: Theme.of(context), // Use the theme from main.dart
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Add this line
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            PlayLists(
                playlists: playlists,
                theme: Theme.of(context)), // Pass the theme here
          ],
        ),
      ),
    );
  }
}
