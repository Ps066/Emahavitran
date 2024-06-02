import 'package:emahavitran/authenticate_home.dart';
import 'package:emahavitran/createuser.dart';
import 'package:emahavitran/flutter_map.dart';
import 'package:emahavitran/home.dart';
import 'package:emahavitran/login.dart';
import 'package:emahavitran/maps.dart';
import 'package:emahavitran/powerTheftAlert.dart';
import 'package:emahavitran/sosAlert.dart';
import 'package:emahavitran/complaintchat.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.blue[800], //<-- SEE HERE
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
// https://www.google.com/maps/search/?api=1&query=47.5951518%2C-122.3316393
