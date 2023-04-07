import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      required this.padding,
      this.txt,
      this.icon,
      this.onChanged,
      this.pass = false})
      : super(key: key);
  final EdgeInsetsGeometry padding;
  String? txt;
  Icon? icon;
  bool pass;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: padding,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Constants.kGreyColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: TextFormField(
                  obscureText: pass ? true : false,
                  onChanged: onChanged,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " $txt";
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                    color: Constants.kBlackColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    constraints:
                        const BoxConstraints(maxHeight: 500, minHeight: 10),
                    prefixIcon: icon,
                    label: Text(
                      ' $txt',
                    ),
                    hintText: "Input $txt",
                    hintStyle: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.6),
                      fontSize: 15,
                      letterSpacing: -0.41,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ],
    );
  }
}

// class form_widget extends StatelessWidget {
//   var formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final screenHight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Form(
//       key: formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           customTextFeild(
//             txt: "user name",
//             icon: const Icon(Icons.person),
//             onChanged: (value) {
//               email = value;
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           customTextFeild(
//             txt: "Password",
//             icon: const Icon(Icons.password_sharp),
//             onChanged: (value) {
//               password = value;
//             },
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           GestureDetector(
//             onTap: () async {
//               if (formKey.currentState!.validate()) {
//                 try {
//                   await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: email.toString(),
//                     password: password.toString(),
//                   );
//                   Navigator.popAndPushNamed(context, AppRoute.moviespage);
//                 } catch (e) {
//                   Navigator.of(context).restorablePush(_dialogBuilder);
//                   print("-------- SIGN IN Error ----------- $e");
//                 }
//               }
//             },
//             child: CustomOutline(
//               strokeWidth: 3,
//               radius: 20,
//               gradient: const LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Constants.kPinkColor,
//                   Constants.kGreenColor,
//                 ],
//               ),
//               width: 160,
//               height: 38,
//               padding: const EdgeInsets.all(3),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Constants.kPinkColor.withOpacity(0.5),
//                       Constants.kGreenColor.withOpacity(0.5),
//                     ],
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'LogIn',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: screenHight <= 660 ? 18 : 20,
//                       fontWeight: FontWeight.w900,
//                       color: Constants.kWhiteColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // ElevatedButton(
//           //   style: ElevatedButton.styleFrom(
//           //     shadowColor: Colors.greenAccent,
//           //     elevation: 3,
//           //     shape: RoundedRectangleBorder(
//           //         borderRadius: BorderRadius.circular(32.0)),
//           //     minimumSize: Size(150, 50), //////// HERE
//           //   ),
//           //   onPressed: () async {
//           //     if (formKey.currentState!.validate()) {
//           //       try {
//           //         await FirebaseAuth.instance
//           //             .signInWithEmailAndPassword(
//           //           email: email.toString(),
//           //           password: password.toString(),
//           //         );
//           //         Navigator.popAndPushNamed(
//           //             context, AppRoute.moviespage);
//           //       } catch (e) {
//           //         Navigator.of(context)
//           //             .restorablePush(_dialogBuilder);
//           //         print("-------- SIGN IN Error ----------- $e");
//           //       }
//           //     }
//           //   },
//           //   child: Text('Login'),
//           // ),
//           const SizedBox(
//             height: 50,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Don'n have account?"),
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, AppRoute.register);
//                 },
//                 child: const Text(
//                   " Register",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// Widget customTextFeild(
//     {String? txt,
//     Icon? icon,
//     void Function(String)? onChanged,
//     required bool pass}) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 20, left: 20),
//     child: TextFormField(
//       obscureText: pass ? true : false,
//       onChanged: onChanged,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return " $txt";
//         } else {
//           return null;
//         }
//       },
//       style: TextStyle(
//         color: Constants.kBlackColor.withOpacity(0.6),
//         fontSize: 17,
//         letterSpacing: -0.41,
//       ),
//       decoration: InputDecoration(
//         isDense: true,
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
//         constraints: const BoxConstraints(maxHeight: 500, minHeight: 10),
//         prefixIcon: icon,
//         label: Text(
//           ' $txt',
//         ),
//         hintText: "Input $txt",
//         hintStyle: TextStyle(
//           color: Constants.kWhiteColor.withOpacity(0.6),
//           fontSize: 15,
//           letterSpacing: -0.41,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   );
// }
