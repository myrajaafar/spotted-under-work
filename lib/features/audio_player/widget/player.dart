import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:spotted/screens/page_manager.dart';
import 'package:spotted/styles.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
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
    var screensize = MediaQuery.of(context).size;
    return Material(
      color: Color.fromARGB(117, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(children: [
              IconButton(
                icon: Image.asset('lib/images/plus-circle.png'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
            // SizedBox(
            //   height: screensize.height * 0.05,
            // ),
            const Text(
              'NOW PLAYING',
              textAlign: TextAlign.center,
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  )
                ],
                fontSize: 24,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontFamily: 'Spartan',
                letterSpacing: 2,
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Image.asset(
              'lib/images/Screenshot 2024-04-24 033817.png',
              height: screensize.width * 0.3,
              width: screensize.width * 0.3,
            ),
            const Text('Song Title', style: AppTextStyles.songTitle),
            const SizedBox(
              height: 10,
            ),
            const Text('Artist', style: AppTextStyles.artist),
            // const SizedBox(
            //   height: 10,
            // ),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable:
                  // Remove the problematic code from the constant context
                  _pageManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  baseBarColor: Colors.black.withOpacity(0.5),
                  progressBarColor: Colors.black.withOpacity(0.7),
                  thumbColor: Colors.white,
                  thumbRadius: 5,
                  timeLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 255, 255, 255),
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _pageManager.seek,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('lib/images/rewind.png'),
                  iconSize: 32.0,
                  onPressed: () {},
                ),
                ValueListenableBuilder<ButtonState>(
                  valueListenable: _pageManager.buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 32.0,
                          height: 32.0,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return IconButton(
                          icon: const Icon(Icons.play_arrow),
                          iconSize: 32.0,
                          onPressed: _pageManager.play,
                        );
                      case ButtonState.playing:
                        return IconButton(
                          icon: Image.asset('lib/images/pause.png'),
                          iconSize: 32.0,
                          onPressed: _pageManager.pause,
                        );
                    }
                  },
                ),
                IconButton(
                  icon: Image.asset('lib/images/forward.png'),
                  iconSize: 32.0,
                  onPressed: () {},
                ),
              ],
            ),
            // SizedBox(
            //   height: screensize.height * 0.1,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {}, icon: Image.asset('lib/images/add.png')),
                const Text(
                  'ADD TO PLAYLIST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
