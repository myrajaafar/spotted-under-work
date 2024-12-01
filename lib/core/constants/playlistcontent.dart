// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../screens/settings.dart';
import '../../screens/friends.dart';
import '../../screens/playlists.dart';
import 'NavBar.dart';

class Song {
  final String title;
  final String artist;
  final String cover;

  Song({required this.title, required this.artist, required this.cover});
}

class SongList extends StatefulWidget {
  final List<Song> songs;

  const SongList({Key? key, required this.songs}) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  void onRemoveSong(Song song) {
    setState(() {
      widget.songs.remove(song);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context)
          .size
          .width, // Use MediaQuery to get the width of the screen
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.songs.length,
        itemBuilder: (context, index) {
          final song = widget.songs[index];
          return ListTile(
            leading: Image.asset(song.cover),
            title:
                Text(song.title, style: TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text(song.artist),
            trailing: IconButton(
              icon: Image.asset(
                'lib/images/removeplaylist.png', // Replace this with your actual image path
                width: MediaQuery.of(context).size.width *
                    0.07, // Set the width of the image based on screen width
                height: MediaQuery.of(context).size.width *
                    0.07, // Set the height of the image based on screen width
              ),
              onPressed: () => onRemoveSong(song),
            ),
          );
        },
      ),
    );
  }
}

class PlaylistBody extends StatefulWidget {
  final String playlistName;
  final String cover;
  final String about;
  final List<Song> songList;

  const PlaylistBody(
      {Key? key,
      required this.playlistName,
      required this.cover,
      required this.about,
      required this.songList})
      : super(key: key);

  @override
  _PlaylistBodyState createState() => _PlaylistBodyState();
}

class _PlaylistBodyState extends State<PlaylistBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
          header: widget.playlistName,
          page: Playlistscreen(),
          theme: ThemeData()),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Content of the playlist
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.87, // Use MediaQuery to get the width of the screen
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.03), // Set the height based on screen height
                    // Cover image
                    Image.asset(widget.cover),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.01), // Set the height based on screen height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Shared clicked');
                            // Handle the click event for 'Shared'
                          },
                          child: Text(
                            'Shared',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    ThemeData().colorScheme.primary),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.26, // Set the width based on screen width
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Edit clicked');
                            // Handle the click event for 'Edit'
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    ThemeData().colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                    // About section
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.01), // Set the height based on screen height
                    Divider(
                      indent: MediaQuery.of(context).size.width *
                          0.03, // Set the indent based on screen width
                      endIndent: MediaQuery.of(context).size.width * 0.03,
                      // Set the end indent based on screen width
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.about,
                        style: TextStyle(
                          fontFamily: 'Spartan',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: MediaQuery.of(context).size.width *
                          0.03, // Set the indent based on screen width
                      endIndent: MediaQuery.of(context).size.width *
                          0.03, // Set the end indent based on screen width
                    ),
                    // Song list
                    SongList(songs: widget.songList),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
