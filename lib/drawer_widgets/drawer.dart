import 'package:flutter/material.dart';
import 'package:demo_call_api/drawer_widgets/build_menu_item.dart';
import 'package:demo_call_api/drawer_widgets/user.dart';

class DrawerWidget extends StatelessWidget {
  final String token;
  const DrawerWidget({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(47, 79, 79, 1),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset("assets/images/globits.png"),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Colors.white),
                const SizedBox(height: 20),
                User(token: token),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Colors.white),
                BuildMenuItem(token: token,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
