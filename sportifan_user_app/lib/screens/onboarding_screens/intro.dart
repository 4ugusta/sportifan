import 'package:flutter/material.dart';
import 'package:sportifan_user/authentication/screens/auth_screen.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({super.key});

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AuthScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          height: 932,
          width: 430,
          color: Colors.deepPurple,
          child: Image.asset('assets/images/Intro.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
