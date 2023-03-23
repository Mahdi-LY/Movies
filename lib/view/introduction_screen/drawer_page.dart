import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../../constants/app_strings.dart";
import "../../route/approute.dart";

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selected = -1;

  void changeSelected(int index) {
    setState(
      () {
        selected = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 60,
            child: Center(
              child: Text(
                AppStrings.appName,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 5,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            selected: selected == 0,
            leading: const Icon(
              Icons.note,
              color: Colors.blue,
            ),
            title: const DrawerText(text: "Home Page"),
            dense: true,
            onTap: () {
              changeSelected(0);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            selected: selected == 1,
            leading: const Icon(
              Icons.delete,
              color: Colors.blue,
            ),
            title: const DrawerText(text: "SginOut"),
            dense: true,
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(
                context,
              );
              // changeSelected(1);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const TrashPage(),
              //   ),
              // );
            },
          ),
          ListTile(
            selected: selected == 2,
            leading: const Icon(
              Icons.tag,
              color: Colors.blue,
            ),
            title: const DrawerText(text: "Tags"),
            dense: true,
            onTap: () {
              // changeSelected(2);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const TagsPage(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerText extends StatelessWidget {
  const DrawerText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      ),
      softWrap: true,
    );
  }
}
