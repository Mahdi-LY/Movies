import 'package:flutter/material.dart';

import '../../route/approute.dart';

class App extends StatelessWidget {
  final bool showHome;
  const App({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trojan Movies',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: showHome ? AppRoute.loginpage : AppRoute.Intro_Secreen,
      onGenerateRoute: AppRoute.ongenratedRoute,
      //home: const HomePageStepOne(),
    );
  }
}
