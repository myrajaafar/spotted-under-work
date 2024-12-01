// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotted/screens/player.dart';

import '../features/playlists/screens/playlists.dart';
import '../features/post/screens/post_screen.dart';
import '../features/profile/screens/profile_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  int selectedIndex = 0;
  int postsCount = 0;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    var _curentIndex = 0;
    return Scaffold(
      body: SizedBox(
        width: screensize.width,
        height: screensize.height,
        child: Column(
          children: [
            //appbar
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                width: screensize.width,
                height: screensize.height * 0.08,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF28374D),
                      width: 1,
                    ),
                  ),
                ),
                child: AppBar(
                  leadingWidth: 60,
                  leading: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 0, top: 0, bottom: 0),
                    child: Image.asset(
                      'lib/images/logo.png',
                      width: 44,
                      height: 40,
                    ),
                  ),
                  centerTitle: true,
                  shape: const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                  ),
                  titleTextStyle: const TextStyle(
                    color: Color(0xFF28374D),
                    fontSize: 32,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  backgroundColor: Colors.white,
                  title: _isSearching
                      ? SizedBox(
                          height: 40,
                          width: 250,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Add this line
                              ),
                            ),
                          ),
                        )
                      : const Text(
                          "FEED",
                          style: TextStyle(
                              color: Color(0xFF28374D),
                              fontSize: 32,
                              fontFamily: 'Spartan',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 20, top: 0, bottom: 0),
                      child: IconButton(
                        icon: Image.asset(
                          'lib/images/Vector1.png',
                          width: 44,
                          height: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearching = !_isSearching;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //main body
            Flexible(
              flex: 11,
              child: Center(
                child: postsCount == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screensize.height * 0.35,
                          ),
                          const Text(
                            'You have no friends :(',
                            style: TextStyle(
                              fontFamily: 'Spartan',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF28374D),
                              letterSpacing: 1,
                            ),
                          ),
                          const Text(
                            'Search for friends to vibe with',
                            style: TextStyle(
                              fontFamily: 'Spartan',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromARGB(174, 40, 55, 77),
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(
                            height: screensize.height * 0.3,
                          ),
                          //floating action button
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Player());
                                  },
                                  backgroundColor: const Color(0xFF28374D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Image.asset('lib/images/playing.png'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : //list of posts
                    ListView.builder(
                        itemCount: postsCount,
                        itemBuilder: (BuildContext context, int index) {
                          return const ListTile(
                            title: Text('Post'),
                          );
                        },
                      ),
              ),
            ),
            //bottom navigation bar
            Flexible(
              flex: 0,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color(0xFF28374D),
                ),
                child: BottomNavigationBar(
                  selectedIconTheme: const IconThemeData(
                      color: Color(0xFF28374D),
                      size: 30), // Increase the size of the icons
                  selectedLabelStyle: const TextStyle(fontSize: 15),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SizedBox(
                          height: 30,
                          child: Image.asset('lib/images/Ellipse 1.png')),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox(
                          height: 30,
                          child: Image.asset('lib/images/playlist.png')),
                      label: 'Playlist',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox(
                        height: 30,
                        child: Image.asset('lib/images/Vector.png'),
                      ),
                      label: 'Notifications',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox(
                          child: Image.asset(
                              height: 30,
                              'lib/images/plus-circle-svgrepo-com 1.png')),
                      label: 'Post',
                    ),
                  ],
                  selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
                  currentIndex: _curentIndex,
                  unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
                  onTap: (int index) {
                    if (index == 0) {
                      Get.to(() => ProfileScreen());
                    } else if (index == 1) {
                      Get.to(() => Playlistscreen());
                    } else if (index == 2) {
                      // Get.to(() => Vibes(
                      //       username: '',
                      //       desc: '',
                      //       image: '',
                      //     ));
                    } else if (index == 3) {
                      showDialog(
                          context: context, builder: (context) => PostScreen());
                      /*overlayController.toggle();
                      Get.to(() => PostScreen());*/
                    }
                    _curentIndex = index;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
