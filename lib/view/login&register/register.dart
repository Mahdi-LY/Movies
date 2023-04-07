import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_outline.dart';
import '../../components/search_filed_widget.dart';
import '../../constants/bk_ground.dart';
import '../../constants/constants.dart';
import '../../route/approute.dart';
import '../widget/form_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

String? username;
String password = "";
String email = "";
String? age;
String? favorite;

class _Register extends State<Register> {
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
      body: Stack(
        children: [
          bk_ground(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 75, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          image: AssetImage('assets/signin.jpg'),
                          fit: BoxFit.fill,
                          alignment: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    icon: const Icon(Icons.person),
                    onChanged: (value) {
                      username = value;
                    },
                    txt: "User Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    icon: const Icon(Icons.email),
                    onChanged: (value) {
                      email = value;
                    },
                    txt: "E-Mail",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    icon: const Icon(Icons.equalizer),
                    onChanged: (value) {
                      age = value;
                    },
                    txt: "Age",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    icon: const Icon(Icons.favorite),
                    onChanged: (value) {
                      favorite = value;
                    },
                    txt: "Favorit",
                  ),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                    onTap: () async {
                      if (email.isNotEmpty && password.isNotEmpty) {
                        try {
                          Navigator.of(context).restorablePush(_loading);
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.trim(),
                            password: password.trim(),
                          );
                          Navigator.pop(context, _loading);
                          Navigator.popAndPushNamed(
                              context, AppRoute.loginpage);
                        } catch (e) {
                          Navigator.pop(context, _loading);
                          Navigator.of(context).restorablePush(_dialogBuilder);
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
                            'SignUp',
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

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shadowColor: Colors.greenAccent,
                  //     elevation: 3,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(32.0)),
                  //     minimumSize: Size(150, 50), //////// HERE
                  //   ),
                  //   onPressed: () async {
                  //     //   if (formKey.currentState!.validate()) {
                  //     try {
                  //       await FirebaseAuth.instance
                  //           .createUserWithEmailAndPassword(
                  //         email: email!.trim(),
                  //         password: password!.trim(),
                  //       );
                  //       Navigator.popAndPushNamed(
                  //           context, AppRoute.loginpage);
                  //     } catch (e) {
                  //       print("-------- SIGN UP ----------- $e");
                  //     }
                  //     //  }
                  //   },
                  //   child: Text('SignIn'),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Aready have account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHight <= 660 ? 12 : 16,
                          fontWeight: FontWeight.w100,
                          color: Constants.kBlackColor.withOpacity(0.75),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.loginpage);
                        },
                        child: const Text(
                          " SignUp",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
