import 'package:demo_call_api/pages/login_page.dart';
import 'package:flutter/material.dart';

enum TestEnum { A }
class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 230, 238, 205),
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        },
      ),
      actions: [
        PopupMenuButton<TestEnum>(
          itemBuilder: (BuildContext context) {
            return popupMenu(context);
          },
        ),
      ],
    );
  }

  List<PopupMenuEntry<TestEnum>> popupMenu(BuildContext context) {
    return <PopupMenuEntry<TestEnum>>[
      PopupMenuItem<TestEnum>(
        value: TestEnum.A,
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
          onTap: () {

          },
        ),
      ),
      PopupMenuItem<TestEnum>(
        value: TestEnum.A,
        child: ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          },
        ),
      ),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
