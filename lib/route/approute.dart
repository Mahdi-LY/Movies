import 'package:flutter/material.dart';
import '../view/introduction_screen/onboarding_secreen.dart';
import '../view/login&register/login_page.dart';
import '../view/login&register/register.dart';
import '../view/movies/homepage02.dart';
import '../view/movies/homepagewithstatemangment.dart';

class AppRoute {
  static const String moviespage = "MoviesPage";
  static const String moviespage02 = "MoviesPage02";
  static const String loginpage = "LoginPage";
  static const String register = "Register";
  static const String Intro_Secreen = "Introduction_Secreen";

  static Route<dynamic> ongenratedRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case moviespage:
        return MaterialPageRoute(
          builder: (context) => HomePageMovies(),
        );
      case moviespage02:
        return MaterialPageRoute(
          builder: (context) => HomePageMovies02(),
        );
      case Intro_Secreen:
        return MaterialPageRoute(
          builder: (context) => OnboardingState_Secreen(),
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
