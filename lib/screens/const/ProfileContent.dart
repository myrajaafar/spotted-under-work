import 'package:flutter/material.dart';
import '../settings.dart';
import '../friends.dart';
import '../playlists.dart';

class ProfileBody extends StatelessWidget {
  final String username;

  const ProfileBody({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: screenHeight * 0.06),
        SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
              radius: screenHeight * 0.1,
              backgroundImage:
                AssetImage('lib/images/aespa karina icon.jpg'),
              ),
              Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.55,
              child: IconButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                  ),
                );
                },
                icon: Icon(Icons.settings),
                iconSize: screenWidth * 0.06,
                color: theme.colorScheme.onBackground,
              ),
              ),
            ],
            ),
          ),
          ],
        ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
        'Rocket Puncher',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.onBackground,
          fontSize: screenWidth * 0.06,
          fontWeight: FontWeight.bold,
          fontFamily: 'Spartan',
        ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          "@$username",
          style: TextStyle(
            color: theme.colorScheme.onBackground,
            fontSize: screenWidth * 0.024,
            fontWeight: FontWeight.w700,
            fontFamily: 'Spartan',
          ),
          ),
          SizedBox(width: screenWidth * 0.04),
          TextButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => friendscreen(),
            ),
            );
          },
          child: Text(
            "62 friends",
            style: TextStyle(
            color: theme.colorScheme.onBackground,
            fontSize: screenWidth * 0.024,
            fontWeight: FontWeight.normal,
            fontFamily: 'Spartan',
            ),
          ),
          ),
        ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: SizedBox(
          width: screenWidth * 0.8,
          height: screenHeight * 0.07,
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Playlistscreen(),
            ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.onBackground,
            foregroundColor: theme.colorScheme.background,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenHeight * 0.035),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            Text(
              'Theme Song : ',
              style: TextStyle(
              color: theme.colorScheme.background,
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.bold,
              fontFamily: 'Spartan',
              ),
            ),
            Text(
              'Song',
              style: TextStyle(
              color: theme.colorScheme.background,
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.w600,
              fontFamily: 'Spartan',
              ),
            ),
            ],
          ),
          ),
        ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
        "Activity",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.onBackground,
          fontSize: screenWidth * 0.08,
          fontWeight: FontWeight.w700,
          fontFamily: 'Spartan',
        ),
        ),
        Divider(
        indent: screenWidth * 0.10,
        endIndent: screenWidth * 0.10,
        color: theme.colorScheme.primary,
        thickness: 1,
        ),
        SizedBox(height: screenHeight * 0.02),
        Container(
        width: 400,
        height: 2000,
        color: theme.colorScheme.primary,
        child: Center(
          child: Text(
          'posts',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: screenWidth * 0.5,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        ),
      ],
      );
  }}