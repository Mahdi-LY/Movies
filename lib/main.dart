import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDwq7FLFSHvDfta1Qhtex2VVoTQVNvduEc",
        appId: "1:274031410759:android:329a8a25e0a5da8cbdfb62",
        messagingSenderId: "274031410759",
        projectId: "movie-347f9"),
  );

  runApp(const App());
}
