
import 'package:flutter/material.dart';
import 'package:demo_call_api/drawer_widgets/menu_item.dart';
import 'package:demo_call_api/pages/home_page.dart';

class BuildMenuItem extends StatelessWidget {
  final String token;
  const BuildMenuItem({super.key, required this.token});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    String home = "Home";
    return Container(
      child: Wrap(
        children: [
          MenuItem(
            home,
            Icons.home,
            onTap: () => _navigateTo(context, HomePage(home, token: token)),
          ),
        ],
      ),
    );
  }
}
