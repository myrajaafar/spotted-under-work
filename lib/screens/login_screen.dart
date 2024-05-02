import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotted/auth.dart';
import 'package:spotted/screens/feed_screen.dart';
import 'package:spotted/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SigninState();
}

class _SigninState extends State<LoginScreen> {
  Function? f() {
    return null;
  }

  String? errorMessage = '';
  bool isLoged = true;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerpass = TextEditingController();
  Future<void> signin() async {
    try {
      await Auth()
          .signin(email: _controller.text, password: _controllerpass.text)
          .whenComplete(() => Get.snackbar("Success", "Signed in",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });

      Get.snackbar("Failure", "$errorMessage",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF475496),
        body: Stack(children: [
          Positioned(
            top: 10,
            left: 29,
            child: Image.asset(
              'lib/images/XMLID_2328_.png',
              alignment: Alignment(-0.5, -0.5),
            ),
          ),
          Positioned(
            top: 28,
            left: 450,
            child: Image.asset(
              'lib/images/XMLID_2318_.png',
              alignment: Alignment(-0.5, -0.5),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset('lib/images/logolight.png'),
                ),
                Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Spartan',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    )),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Spartan',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      controller: _controllerpass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        print('button pressed');
                        signin().then((value) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => FeedScreen2())))
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(178, 203, 164, 255),
                        foregroundColor: Color(0xFFFFFFFF),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(178, 203, 164, 255),
                        foregroundColor: Color(0xFFFFFFFF),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Forgot password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  child: Text('Not Registered Yet?',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Spartan',
                          color: Color(0xFFFFFFFF))),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => RegisterScreen())));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(178, 203, 164, 255),
                    foregroundColor: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 20,
              child: Text(
                "MADE WITH LOVE BY YOMIRAYA CO.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color.fromARGB(166, 255, 255, 255),
                    fontSize: 10,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]));
  }
}
