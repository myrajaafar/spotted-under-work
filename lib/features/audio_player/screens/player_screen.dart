import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotted/screens/page_manager.dart';

class PlayeScreen extends StatefulWidget {
  const PlayeScreen({super.key});

  @override
  State<PlayeScreen> createState() => _PlayeScreenState();
}

class _PlayeScreenState extends State<PlayeScreen> {
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
                            color:
                                Color.fromARGB(255, 71, 56, 56).withOpacity(1),
                            border: Border.all(
                              color: const Color.fromARGB(0, 0, 0, 0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            backgroundBlendMode: BlendMode.screen,
                          ),
                          // Positioned(
                          //   top: 0,
                          //   left: 0,
                          //   child: IconButton(
                          //     icon: Image.asset('lib/images/plus-circle.png'),
                          //     onPressed: overlayController.toggle,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  );
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
