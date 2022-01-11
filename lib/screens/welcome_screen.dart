import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_tarun_three/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      upperBound: 1.0,
    );

    animation =
        ColorTween(begin: Colors.teal, end: Colors.white).animate(controller!);

    controller?.forward();

    controller?.addListener(() {
      //setState is important for color red backgrond animation to work
      setState(() {});
      //print(animation?.value);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  //'${controller.value.toInt()*100}%',
                  text: [
                    'Flash Chat',
                  ],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              color: Colors.lightBlueAccent,
              onpressed: () {
                Firebase.initializeApp().whenComplete(() =>
                Navigator.pushNamed(context, LoginScreen.id));
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onpressed: () {
                Firebase.initializeApp().whenComplete(
                  () => Navigator.pushNamed(context, RegistrationScreen.id),
                  //Navigator.pushNamed(context, RegistrationScreen.id
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
