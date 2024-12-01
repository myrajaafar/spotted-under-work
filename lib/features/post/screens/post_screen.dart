// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:faabul_color_picker/faabul_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:spotted/styles.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Color? _selectedColor;
  final bool _allowUnselectButton = false;
  final bool _customColors = false;

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
    return Dialog(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      IconButton(
                        icon: Image.asset('lib/images/plus-circle.png'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'POST A VIBE',
                        style: AppTextStyles.title,
                      ),
                      SizedBox(
                        width: 45,
                      )
                    ]),
                SizedBox(
                  height: 20,
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
                    hintStyle: TextStyle(
                      fontFamily: 'Spartan',
                      letterSpacing: 1,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                    hintStyle: TextStyle(
                      fontFamily: 'Spartan',
                      letterSpacing: 1,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                    hintStyle: TextStyle(
                      fontFamily: 'Spartan',
                      letterSpacing: 1,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: screensize.width,
                  height: 50,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Color(0xFF28374D))),
                  onPressed: () {
                    _handlePickColor();
                  },
                  child: Text('Post Color', style: AppTextStyles.body),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: screensize.width,
                  height: screensize.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: const [
                      Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 11, top: 11, bottom: 11),
                            child: Text('Anything to Say?',
                                style: AppTextStyles.body),
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 11, right: 11),
                          child: TextField(
                            minLines: 4,
                            maxLines: 5,
                            maxLength: 200,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              hintText: 'Write Here',
                              hintStyle: TextStyle(
                                fontFamily: 'Spartan',
                                letterSpacing: 1,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Post >', style: AppTextStyles.title),
                    ),
                  ]),
                )
              ],
            ),
          ),
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
