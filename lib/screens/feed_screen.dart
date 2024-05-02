// ignore_for_file: unused_field

import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotted/screens/page_manager.dart';

import 'post_screen.dart';

class FeedScreen2 extends StatefulWidget {
  const FeedScreen2({super.key});

  @override
  State<FeedScreen2> createState() => _FeedScreen2State();
}

class _FeedScreen2State extends State<FeedScreen2> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  int selectedIndex = 0;
  int postsCount = 0;

  @override
  Widget build(BuildContext context) {
    var overlayController = OverlayPortalController();
    final screensize = MediaQuery.of(context).size;
    return Container(
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
                              borderRadius:
                                  BorderRadius.circular(30.0), // Add this line
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
                          const FloatingPlayerButton(),
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
                      )),
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
                currentIndex: selectedIndex,
                onTap: (int index) {
                  if (index == 3) {
                    overlayController.toggle();
                    Get.to(() => PostScreen());
                  }
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingPlayerButton extends StatefulWidget {
  const FloatingPlayerButton({super.key});

  @override
  State<FloatingPlayerButton> createState() => _FloatingPlayerButtonState();
}

class _FloatingPlayerButtonState extends State<FloatingPlayerButton> {
  late final PageManager _pageManager;

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager.init();
  }

  @override
  Widget build(BuildContext context) {
    var overlayController = OverlayPortalController();
    var screensize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
              ),
              backgroundColor: const Color(0xFF28374D),
              onPressed: overlayController.toggle,
              child: OverlayPortal(
                controller: overlayController,
                overlayChildBuilder: (BuildContext context) {
                  return Positioned(
                      child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: screensize.height * 0.85,
                        width: screensize.width * 0.85,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 216, 255)
                              .withOpacity(0.5),
                          border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          backgroundBlendMode: BlendMode.screen,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'NOW PLAYING',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFF28374D),
                                    letterSpacing: 1,
                                  ),
                                ),
                                //SONG PLAYER
                                SizedBox(
                                  height: screensize.height * 0.3,
                                  //song player
                                  child: Builder(builder: (context) {
                                    return Column(
                                      children: [
                                        const Spacer(),
                                        ValueListenableBuilder<
                                            ProgressBarState>(
                                          valueListenable:
                                              // Remove the problematic code from the constant context
                                              _pageManager.progressNotifier,
                                          builder: (_, value, __) {
                                            return ProgressBar(
                                              progress: value.current,
                                              buffered: value.buffered,
                                              total: value.total,
                                              onSeek: _pageManager.seek,
                                            );
                                          },
                                        ),
                                        ValueListenableBuilder<ButtonState>(
                                          valueListenable:
                                              _pageManager.buttonNotifier,
                                          builder: (_, value, __) {
                                            switch (value) {
                                              case ButtonState.loading:
                                                return Container(
                                                  margin:
                                                      const EdgeInsets.all(8.0),
                                                  width: 32.0,
                                                  height: 32.0,
                                                  child:
                                                      const CircularProgressIndicator(),
                                                );
                                              case ButtonState.paused:
                                                return IconButton(
                                                  icon: const Icon(
                                                      Icons.play_arrow),
                                                  iconSize: 32.0,
                                                  onPressed: _pageManager.play,
                                                );
                                              case ButtonState.playing:
                                                return IconButton(
                                                  icon: const Icon(Icons.pause),
                                                  iconSize: 32.0,
                                                  onPressed: _pageManager.pause,
                                                );
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: IconButton(
                                icon: Image.asset('lib/images/plus-circle.png'),
                                onPressed: overlayController.toggle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                child: SizedBox(
                  child: Image.asset(
                    'lib/images/playing.png',
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
