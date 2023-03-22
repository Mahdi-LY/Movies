import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/approute.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

String? username;
String? password;
String? email;
String? age;
String? favorite;

class _Register extends State<Register> {
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
          padding: const EdgeInsets.fromLTRB(20, 95, 20, 40),
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
                  height: 30,
                ),
                customTextFeild(
                  txt: "user name",
                  icon: const Icon(Icons.person),
                  onChanged: (value) {
                    username = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextFeild(
                  txt: "E-mail",
                  icon: const Icon(Icons.email),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextFeild(
                  txt: "Age",
                  icon: const Icon(Icons.equalizer),
                  onChanged: (value) {
                    age = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextFeild(
                  txt: "favorite",
                  icon: const Icon(Icons.favorite),
                  onChanged: (value) {
                    favorite = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextFeild(
                  txt: "Password",
                  icon: const Icon(Icons.password_sharp),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 30,
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
                    //   if (formKey.currentState!.validate()) {
                    try {
                      // bool vis = true;
                      // Visibility(
                      //     visible: vis, child: CircularProgressIndicator());
                      // //Future.delayed(2);
                      // setState(() {
                      //   vis = false;
                      // });
                      print(
                        email.toString().trim(),
                      );
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!.trim(),
                        password: password!.trim(),
                      );
                      Navigator.pushNamed(context, AppRoute.moviespage);
                    } catch (e) {
                      print("-------- SIGN UP ----------- $e");
                    }
                    //  }
                  },
                  child: Text('Sign Up'),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Aready have account?"),
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
                )
              ],
            ),
          ),
        ),
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
