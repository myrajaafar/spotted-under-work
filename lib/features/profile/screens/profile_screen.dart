// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../screens/settings.dart';
import '../../../screens/friends.dart';
import '../../../core/constants/NavBar.dart';
import '../../../core/constants/ProfileContent.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfileAppBar(
          header: 'you',
          page: ProfileScreen(),
          theme: ThemeData()
        ),
        body: SingleChildScrollView(
            child: ProfileBody(
          username: 'me',
        )));
  }
}
