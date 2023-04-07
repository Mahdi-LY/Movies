import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_movies/view/login&register/register.dart';
import '../../components/custom_outline.dart';
import '../../components/search_filed_widget.dart';
import '../../constants/bk_ground.dart';
import '../../constants/constants.dart';
import '../../route/approute.dart';
import '../widget/form_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

String email = "";
String password = "";

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final ButtonStyle style = ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 40),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),

          // side: BorderSide(color: Colors.red),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.black),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            bk_ground(),
            SizedBox(
              width: screenWidth,
              height: screenHight,
              child: Stack(children: [
                Center(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHight * 0.07,
                        ),
                        CustomOutline(
                          strokeWidth: 4,
                          radius: screenWidth * 0.6,
                          padding: const EdgeInsets.all(4),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Constants.kPinkColor,
                              Constants.kPinkColor.withOpacity(0),
                              Constants.kGreenColor.withOpacity(0.1),
                              Constants.kGreenColor,
                            ],
                            stops: const [0.2, 0.4, 0.6, 1],
                          ),
                          width: screenWidth * 0.6,
                          height: screenWidth * 0.6,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/movie-posters/movies-signup.jpg'),
                                fit: BoxFit.fill,
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHight * 0.07,
                        ),
                        // const SearchFieldWidget(
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        // ),
                        ///////////////////////////////////////////
                        TextFieldWidget(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          icon: const Icon(Icons.person),
                          onChanged: (value) {
                            email = value;
                          },
                          txt: "E-Mail",
                        ),
                        SizedBox(
                          height: screenHight * 0.02,
                        ),
                        TextFieldWidget(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          icon: const Icon(Icons.password),
                          onChanged: (value) {
                            password = value;
                          },
                          txt: "Password",
                          pass: true,
                        ),
                        ///////////////////////////////////////////////////
                        // Text(
                        //   'Watch movies in \n Trojan Moveis',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: screenHight <= 660 ? 18 : 34,
                        //     fontWeight: FontWeight.w700,
                        //     color: Constants.kWhiteColor.withOpacity(0.8),
                        //   ),
                        // ),
                        SizedBox(
                          height: screenHight * 0.05,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (email.isNotEmpty && password.isNotEmpty) {
                              try {
                                Navigator.of(context).restorablePush(_loading);
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: email.toString(),
                                  password: password.toString(),
                                );
                                Navigator.pop(context, _loading);
                                Navigator.popAndPushNamed(
                                    context, AppRoute.moviespage02);
                              } catch (e) {
                                Navigator.pop(context, _loading);
                                Navigator.of(context)
                                    .restorablePush(_dialogBuilder);
                                print("-------- SIGN IN Error ----------- $e");
                              }
                            }
                          },
                          child: CustomOutline(
                            strokeWidth: 3,
                            radius: 20,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kPinkColor,
                                Constants.kGreenColor,
                              ],
                            ),
                            width: 160,
                            height: 50,
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Constants.kPinkColor.withOpacity(0.5),
                                    Constants.kGreenColor.withOpacity(0.5),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'LogIn',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenHight <= 660 ? 18 : 20,
                                    fontWeight: FontWeight.w900,
                                    color: Constants.kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: screenHight * 0.13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don'n have account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenHight <= 660 ? 12 : 16,
                                fontWeight: FontWeight.w100,
                                color: Constants.kBlackColor.withOpacity(0.75),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.register);
                              },
                              child: const Text(
                                " Register",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomOutline(
                              strokeWidth: 1,
                              radius: screenWidth * 0.6,
                              padding: const EdgeInsets.all(1),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Constants.kPinkColor,
                                  Constants.kPinkColor.withOpacity(0),
                                  Constants.kGreenColor.withOpacity(0.1),
                                  Constants.kGreenColor,
                                ],
                                stops: const [0.2, 0.4, 0.6, 1],
                              ),
                              width: screenWidth * 0.12,
                              height: screenWidth * 0.12,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/icons-facebook.png'),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                              ),
                            ),
                            CustomOutline(
                              strokeWidth: 1,
                              radius: screenWidth * 0.6,
                              padding: const EdgeInsets.all(1),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Constants.kPinkColor,
                                  Constants.kPinkColor.withOpacity(0),
                                  Constants.kGreenColor.withOpacity(0.1),
                                  Constants.kGreenColor,
                                ],
                                stops: const [0.2, 0.4, 0.6, 1],
                              ),
                              width: screenWidth * 0.12,
                              height: screenWidth * 0.12,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/icons-twitter.png'),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                              ),
                            ),
                            CustomOutline(
                              strokeWidth: 1,
                              radius: screenWidth * 0.6,
                              padding: const EdgeInsets.all(1),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Constants.kPinkColor,
                                  Constants.kPinkColor.withOpacity(0),
                                  Constants.kGreenColor.withOpacity(0.1),
                                  Constants.kGreenColor,
                                ],
                                stops: const [0.2, 0.4, 0.6, 1],
                              ),
                              width: screenWidth * 0.12,
                              height: screenWidth * 0.12,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/icons-github.png'),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(
          Icons.warning_rounded,
          size: 100,
          color: Colors.red,
        ),
        title: Center(child: const Text('Warring Login')),
        //content: const Text('Check User Name And Password'),
        actions: <Widget>[
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: Theme.of(context).textTheme.labelLarge,
          //   ),
          //   child: const Text('Disable'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Ok', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Route<Object?> _loading(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 20,
        width: 20,
        child: Center(child: CircularProgressIndicator()),
      );
    },
  );
}

// SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 140, 20, 40),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   height: 130,
//                   width: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.black,
//                   ),
//                   // ignore: prefer_const_constructors
//                   child: Text(
//                     "Trojan",
//                     style: const TextStyle(
//                         color: Colors.blueGrey,
//                         fontSize: 40,
//                         fontStyle: FontStyle.italic,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 customTextFeild(
//                   txt: "user name",
//                   icon: const Icon(Icons.person),
//                   onChanged: (value) {
//                     email = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 customTextFeild(
//                   txt: "Password",
//                   icon: const Icon(Icons.password_sharp),
//                   onChanged: (value) {
//                     password = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shadowColor: Colors.greenAccent,
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(32.0)),
//                     minimumSize: Size(150, 50), //////// HERE
//                   ),
//                   onPressed: () async {
//                     if (formKey.currentState!.validate()) {
//                       try {
//                         await FirebaseAuth.instance.signInWithEmailAndPassword(
//                           email: email.toString(),
//                           password: password.toString(),
//                         );
//                         Navigator.popAndPushNamed(context, AppRoute.moviespage);
//                       } catch (e) {
//                         Navigator.of(context).restorablePush(_dialogBuilder);
//                         print("-------- SIGN IN Error ----------- $e");
//                       }
//                     }
//                   },
//                   child: Text('Login'),
//                 ),
//                 const SizedBox(
//                   height: 170,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don'n have account?"),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushNamed(context, AppRoute.register);
//                       },
//                       child: const Text(
//                         " Register",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),

Widget customTextFeild(
    {String? txt, Icon? icon, void Function(String)? onChanged}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20),
    child: TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return " $txt";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        constraints: const BoxConstraints(maxHeight: 500, minHeight: 10),
        prefixIcon: icon,
        label: Text(
          ' $txt',
        ),
        hintText: "Input $txt",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
