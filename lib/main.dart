import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDwq7FLFSHvDfta1Qhtex2VVoTQVNvduEc",
        appId: "1:274031410759:android:329a8a25e0a5da8cbdfb62",
        messagingSenderId: "274031410759",
        projectId: "movie-347f9"),
  );

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('ShowHome') ?? false;

  runApp(App(showHome: showHome));
}
