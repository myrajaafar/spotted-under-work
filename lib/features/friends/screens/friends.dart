// ignore_for_file: use_super_parameters, library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

import '../core/constants/NavBar.dart';
import '../features/profile/screens/others_Profile.dart';
import '../features/profile/screens/profile_screen.dart';

class friendscreen extends StatefulWidget {
  const friendscreen({Key? key}) : super(key: key);

  @override
  State<friendscreen> createState() => _FriendsScreenState();
}

class Friend {
  final String name;
  final String avatar;

  Friend({required this.name, required this.avatar});
}

class FriendList extends StatefulWidget {
  final List<Friend> friends;

  const FriendList({Key? key, required this.friends}) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  Map<Friend, bool> unfollowStatus =
      {}; // Map to store unfollow status for each friend

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      // Wrap the Column with a SizedBox
      width: screenWidth * 0.9, // Set the width to 90% of the screen width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var friend in widget.friends)
            ListTile(
              onTap: () {
                // Open the profile of the friend
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OthersProfileScreen(username: friend.name),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(friend.avatar),
              ),
              title: Text(
                friend.name.toUpperCase(),
                style: TextStyle(
                  fontSize: screenWidth *
                      0.05, // Adjust font size based on screen width
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  // Implement unfollow functionality
                  setState(() {
                    unfollowStatus[friend] = !(unfollowStatus[friend] ??
                        false); // Toggle the unfollow status for this friend
                  });
                  print('Unvibe ${friend.name}');
                },
                child: Image.asset(
                  unfollowStatus[friend] == true
                      ? 'lib/images/vibe.png'
                      : 'lib/images/unvibe.png',
                  width: screenWidth *
                      0.06, // Adjust icon size based on screen width
                  height: screenWidth *
                      0.06, // Adjust icon size based on screen width
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FriendsScreenState extends State<friendscreen> {
  final List<Friend> friends = [
    Friend(name: 'Friend 1', avatar: 'lib/images/aespa karina icon.jpg'),
    Friend(name: 'Friend 2', avatar: 'lib/images/aespa karina icon.jpg'),
    // Add more friends as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //theme is not changing based on the friends settigns!!!!-yomna
      appBar: ProfileAppBar(
          header: 'friends',
          page: ProfileScreen(),
          theme: Theme.of(context)), // Page should be of the user!
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: screenWidth *
                      0.04), // Adjust spacing based on screen width
              FriendList(friends: friends),
            ],
          ),
        ),
      ),
    );
  }
}
