// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String header;
  final Widget page;
  final ThemeData theme;

  ProfileAppBar({
    required this.header,
    required this.page,
    required this.theme,
  });

  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.page),
            );
          },
           //download svg and change according to accent/onbackground
          icon: Image.asset('lib/images/goback.png'),
          iconSize: screenWidth * 0.09,
          color: theme.colorScheme.onBackground,
        ),
        centerTitle: true,
        title: Text(
          widget.header.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: theme.colorScheme.onBackground,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Image.asset(
              //download svg and change according to accent/onbackground
              'lib/images/lightlogoicon.png',
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
            ),
          ),
        ],
        shape: Border(bottom: BorderSide(color: theme.colorScheme.onBackground, width: 1)),
      ),
    );
  }


}
