import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotted/auth.dart';
import 'package:spotted/screens/feed_screen.dart';
import 'package:spotted/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _SignupState();
}

class _SignupState extends State<RegisterScreen> {
  Function? f() {
    return null;
  }

  String? errorMessage = '';
  bool isLoged = true;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerpass = TextEditingController();
  final TextEditingController _controllerusername = TextEditingController();

  Future<void> signup() async {
    await Auth()
        .signup(
            email: _controller.text,
            password: _controllerpass.text,
            username: _controllerusername.text)
        .then(onError: (e) {
      setState(() {
        errorMessage = e.message;
      });

      Get.snackbar("Failure", "$errorMessage",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    },
            (value) => Get.snackbar("Success", "Signed in",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green));
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
                SizedBox(height: 25),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset('lib/images/logolight.png'),
                ),
                Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
                SizedBox(height: 25),
                //USERNAME
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
                        controller: _controllerusername,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    )),
                //EMAIL
                SizedBox(
                  width: 300,
                  child: Text(
                    'Email',
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
                //PASSWORD
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
                //CONFIRM PASSWORD
                SizedBox(
                  width: 300,
                  child: Text(
                    'Confirm Password',
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
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    signup().then((value) => {Get.to(() => FeedScreen())});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(178, 203, 164, 255),
                    foregroundColor: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 15,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginScreen())));
                    },
                    child: SizedBox(
                      height: 20,
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Spartan',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
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
              ],
            ),
          ),
        ]));
  }
}
