import 'package:flutter/material.dart';

import '../../route/approute.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trojan Movies',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: AppRoute.loginpage,
      onGenerateRoute: AppRoute.ongenratedRoute,
      //home: const HomePageStepOne(),
    );
  }
}
