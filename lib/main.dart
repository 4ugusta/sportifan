import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportifan_user/routing/routes.dart';
import 'package:sportifan_user/authentication/screens/auth_screen.dart';
import 'package:sportifan_user/constants/routes.dart';
import 'package:sportifan_user/screens/homeview.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// flutter: 932.0
// flutter: 430.0
Future<bool> checkSignIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? uid=prefs.getString("uid");
  if(uid==null){
    return false;
  }
  else{
    return true;
  }
 
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isSigned = await checkSignIn();
  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isSigned ? const HomeView() : AuthScreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      routes: {
        homePageRoute: (context) => const HomeView(),
      },
    ),
  ));
}
