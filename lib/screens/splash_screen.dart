import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:spotted/screens/login_screen.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen(
        duration: const Duration(seconds: 2),
        nextScreen: const LoginScreen(),
        backgroundColor: const Color(0xFF475496),
        splashScreenBody: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  'lib/images/clouds.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                width: 170,
                height: 167.38,
                child: Image.asset('lib/images/logolight.png'),
              ),
              const Text(
                "SPOTTED",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold),
              ),
              const Text("Spot Your Vibe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold)),
              const Spacer(
                flex: 3,
              ),
              const Text(
                "MADE WITH LOVE BY YOMIRAYA CO.",
                style: TextStyle(
                    color: Color.fromARGB(166, 255, 255, 255),
                    fontSize: 10,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
