import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_tarun_three/screens/welcome_screen.dart';
import 'package:flash_chat_tarun_three/screens/login_screen.dart';
import 'package:flash_chat_tarun_three/screens/registration_screen.dart';
import 'package:flash_chat_tarun_three/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //initialRoute: WelcomeScreen().id,//use static modifier to simplify code

      //Firebase.initializeApp().whenComplete(() => N)

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id :(context) =>RegistrationScreen(),
        ChatScreen.id :(context) => ChatScreen(),
      },
    );
  }
}