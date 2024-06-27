import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportifan_user/Routing/routes.dart';
import 'package:sportifan_user/authentication/screens/auth_screen.dart';
import 'package:sportifan_user/constants/routes.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// flutter: 932.0
// flutter: 430.0
Future<bool> checkSignIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? uid = prefs.getString("uid");
  if (uid == null) {
    return false;
  } else {
    return true;
  }
}

void logout(BuildContext context) {
  SharedPreferences.getInstance().then((prefs) {
    prefs.remove("uid");
  });
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    return const AuthScreen();
  }), (route) => false);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isSigned = await checkSignIn();
  runApp(MyApp(isSigned: isSigned));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final bool isSigned;
  const MyApp({super.key, required this.isSigned});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            home: isSigned ? const HomeView() : const AuthScreen(),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            routes: {
              homePageRoute: (context) => const HomeView(),
            },
          );
        },
      ),
    );
  }
}
