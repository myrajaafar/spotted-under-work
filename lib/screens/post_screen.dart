// ignore_for_file: prefer_const_constructors
import 'package:faabul_color_picker/faabul_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feed_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Color? _selectedColor;
  bool _allowUnselectButton = false;
  bool _customColors = false;

  static const _kCustomColors = [
    FaabulColorShades(color: Colors.red, shades: [
      Colors.red,
      Colors.redAccent,
    ]),
    FaabulColorShades(color: Colors.green, shades: [
      Colors.lightGreen,
      Colors.green,
      Colors.lightGreenAccent,
      Colors.greenAccent,
    ]),
    FaabulColorShades(color: Colors.blue, shades: [
      Colors.lightBlue,
      Colors.blue,
      Colors.lightBlueAccent,
      Colors.blueAccent,
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _selectedColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'POST A VIBE',
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: Image.asset('lib/images/plus-circle.png'),
              onPressed: () {
                Get.to(() => FeedScreen2());
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                suffixIcon: Icon(
                  Icons.search,
                ),
                hintText: 'Choose Song',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Genre/Artist Feel',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Vibe With',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
                minWidth: screensize.width,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  _handlePickColor();
                },
                child: Text('Pick Color')),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePickColor() async {
    final color = await showColorPickerDialog(
      context: context,
      selected: _selectedColor,
      allowUnselectButton: _allowUnselectButton,
      colors: _customColors ? _kCustomColors : null,
    );
    if (!mounted) return;
    setState(() => _selectedColor = color);
  }
}
