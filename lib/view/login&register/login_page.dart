import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../route/approute.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

String? email;
String? password;

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 140, 20, 40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Trojan",
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                customTextFeild(
                  txt: "user name",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                customTextFeild(
                  txt: "Password",
                  icon: const Icon(Icons.password_sharp),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 50), //////// HERE
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email.toString(),
                          password: password.toString(),
                        );
                        Navigator.popAndPushNamed(context, AppRoute.moviespage);
                      } catch (e) {
                        Navigator.of(context).restorablePush(_dialogBuilder);
                        print("-------- SIGN IN Error ----------- $e");
                      }
                    }
                  },
                  child: Text('Login'),
                ),
                const SizedBox(
                  height: 170,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don'n have account?"),
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
                )
              ],
            ),
          ),
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
        icon: Icon(
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
