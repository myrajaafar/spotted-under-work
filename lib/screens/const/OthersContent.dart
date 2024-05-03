import 'package:flutter/material.dart';

import '../friends.dart';
import '../other_playlists.dart';
import '../playlists.dart';

// Import the ThemeClass

// ignore: must_be_immutable
class OthersProfileBody extends StatefulWidget {
  final String username;
  final bool isPrivate;
  bool follow;
  final ThemeData
      themeData; // Add a boolean flag to indicate if the profile is private
// Accept the ThemeClass object// Extract the accent color

  OthersProfileBody({
    Key? key,
    required this.username,
    required this.isPrivate,
    this.follow = false,
    required this.themeData,
  }) : super(key: key);

  @override
  _OthersProfileBodyState createState() => _OthersProfileBodyState();
}

class _OthersProfileBodyState extends State<OthersProfileBody> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the top
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: screenHeight * 0.1,
                        backgroundImage: AssetImage('lib/images/Ellipse-1.jpg'),
                      ),
                      if (!widget.isPrivate)
                        Positioned(
                          bottom: screenHeight * 0.13,
                          left: screenWidth * 0.10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OthersPlaylistscreen(
                                        theme: Theme.of(
                                            context))), // ma3raftch kepp the same theme as the profile
                              );
                            },
                            icon: Image.asset('lib/images/playlistdark.png',
                                width: screenWidth * 0.07,
                                height: screenWidth * 0.07),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Rocket Puncher',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              width: screenWidth * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.follow)
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.follow = !widget.follow;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                // Add the desired color here
                                ),
                            child: Text(
                              widget.follow ? "Vibing" : "Vibe",
                              style: TextStyle(
                                fontSize: screenWidth * 0.024,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                        ],
                      ),
                    ),
                  if (!widget.follow && !widget.isPrivate)
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.follow = !widget.follow;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                // Add the desired color here
                                ),
                            child: Text(
                              widget.follow ? "Vibing" : "Vibe",
                              style: TextStyle(
                                fontSize: screenWidth * 0.024,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                        ],
                      ),
                    ),
                  if (widget.isPrivate)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle request to vibe
                        },
                        style: ElevatedButton.styleFrom(
                            // Add the desired color here
                            ),
                        child: Text(
                          "Request to Vibe",
                          style: TextStyle(
                            fontSize: screenWidth * 0.024,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Spartan',
                          ),
                        ),
                      ),
                    ),
                  if (!widget.isPrivate)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => friendscreen(),
                          ),
                        );
                      },
                      child: Text(
                        "62 friends",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: screenWidth * 0.024,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            if (!widget.isPrivate) // Show only if the profile is not private
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Playlistscreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.035),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Theme Song : ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Song',
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.02),
            if (!widget.isPrivate) // Show only if the profile is not private
              Text(
                "Activity",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Spartan',
                ),
              ),
            SizedBox(height: screenHeight * 0.01),
            Divider(
              indent: screenWidth * 0.10,
              endIndent: screenWidth * 0.10,
            ),
            SizedBox(height: screenHeight * 0.01),
            if (widget.isPrivate) // Show only if the profile is private
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: screenWidth * 0.5,
                    height: screenHeight,
                    // Use theme color
                    child: Center(
                      child: Text(
                        'posts',
                        style: TextStyle(
                          // Use accent color
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
