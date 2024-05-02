// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'settings.dart';
import 'friends.dart';
import 'const/NavBar.dart';
import 'const/OthersContent.dart';
import '../theme_data.dart';

class OthersProfileScreen extends StatefulWidget {
final String username;

const OthersProfileScreen({super.key, required this.username, });

  @override
  State<OthersProfileScreen> createState() => _OthersProfileScreenState();
}


class _OthersProfileScreenState extends State<OthersProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfileAppBar(
          header: widget.username,
          page: friendscreen(),
          theme: ThemeClass.profileTheme(
            ThemeClass().bgvampirepurple, // Background color
            ThemeClass().acBlue,)
        ),
        body: SingleChildScrollView(
            child: OthersProfileBody(
          username: widget.username,
          isPrivate:
          false,
          follow: false,
          themeData: ThemeClass.profileTheme(
            ThemeClass().bgvampirepurple, // Background color
            ThemeClass().acBlue, // Accent color
        ))));
  }
}