import 'package:flutter/material.dart';
import '../view/login&register/login_page.dart';
import '../view/login&register/register.dart';
import '../view/movies/homepagewithstatemangment.dart';

class AppRoute {
  static const String moviespage = "MoviesPage";
  static const String loginpage = "LoginPage";
  static const String register = "Register";

  static Route<dynamic> ongenratedRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case moviespage:
        return MaterialPageRoute(
          builder: (context) => HomePageMovies(),
        );
      case loginpage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                    body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [Text("No Found Page !!")],
                )));
    }
  }
}
