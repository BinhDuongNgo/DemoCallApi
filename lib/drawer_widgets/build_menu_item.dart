import 'package:demo_call_api/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_call_api/drawer_widgets/menu_item.dart';
import 'package:demo_call_api/pages/home_page.dart';

class BuildMenuItem extends StatelessWidget {
  final String username;
  final String id;
  final Map lists;
  const BuildMenuItem({super.key, required this.username, required this.id, required this.lists});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    String home = "Home";
    String profile = "Profile";
    return Container(
      child: Wrap(
        children: [
          MenuItem(
            home,
            Icons.home,
            onTap: () => _navigateTo(context, HomePage(home, username: username, id: id, lists: lists)),
          ),
          MenuItem(
            profile,
            Icons.person,
            onTap: () => _navigateTo(context, ProfilePage(profile, username: username, id: id, lists: lists)),
          ),
        ],
      ),
    );
  }
}
