// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<String>> searchMusic(String query) async {
  var response = await http.get(Uri.parse(
      'https://www.theaudiodb.com/api/v1/json/1/search.php?s=$query'));
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var tracks = jsonResponse['tracks'];
    return tracks.take(3).map((track) => track['strTrack']).toList();
  } else {
    throw Exception('Failed to load music');
  }
}

class FieldLabels {
  static const List<String> fieldlabels = [
    'Choose song',
    'Genre/Artist Feel',
    'Vibe With',
    'Post Color',
    'Add Description',
  ];
}

class PostScreen2 extends StatefulWidget {
  const PostScreen2({super.key});

  @override
  State<PostScreen2> createState() => _PostScreen2State();
}

class _PostScreen2State extends State<PostScreen2> {
  String _currentSearchQuery = '';
  List<String> _searchResults = [];
  void _handleSearch(String query) {
    setState(() {
      _currentSearchQuery = query;
    });
    searchMusic(_currentSearchQuery).then((results) {
      setState(() {
        _searchResults = results;
      });
    }).catchError((error) {
      // Handle the error
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionPanelList(
        children: FieldLabels.fieldlabels.asMap().entries.map((entry) {
          int index = entry.key;
          String label = entry.value;
          return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(label),
              );
            },
            body: index == 0
                ? TextField(
                    decoration: const InputDecoration(
                      hintText: 'Choose a song',
                    ),
                    onChanged: _handleSearch,
                  )
                : const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter text',
                    ),
                  ),
          );
        }).toList(),
      ),
    );
  }
}
