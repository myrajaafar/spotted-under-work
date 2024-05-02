// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'const/NavBar.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ProfileAppBar profileAppBar = ProfileAppBar(header: 'Settings', page: ProfileScreen(), theme: ThemeData());
  List<String> buttonTexts = [
    'Edit profile',
    'Notifications',
    'Privacy',
    'Security',
    'Help & About',
    'Log out'
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final buttonWidth = mediaQuery.size.width * 0.8;
    final buttonHeight = mediaQuery.size.height * 0.1;
    final buttonTextSize = mediaQuery.textScaleFactor * 16;

    return Scaffold(
      appBar: profileAppBar,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              buttonTexts.length,
              (index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      switch (index) {
                        case 0:
                          // Navigate to Edit Profile page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()), // Replace with your page widget
                          );
                          break;
                        case 1:
                          // Navigate to Notifications page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()), // Replace with your page widget
                          );
                          break;
                        // Add cases for remaining buttons with corresponding page navigation
                        default:
                          print('Button index not mapped to a page');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: buttonWidth * 0.1, vertical: buttonHeight * 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonHeight * 0.5),
                      ),
                    ),
                    child: Text(
                      buttonTexts[index].toUpperCase(), // Display the text from the list
                      style: TextStyle(
                        fontSize: buttonTextSize,
                        fontWeight: FontWeight.bold,
                        // Ensure 'Spartan' font is available
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

