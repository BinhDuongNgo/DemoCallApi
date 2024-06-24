import 'package:demo_call_api/appbar_widget.dart';
import 'package:demo_call_api/drawer_widgets/drawer.dart';
import 'package:demo_call_api/footer_widget.dart';
import 'package:demo_call_api/profile_widgets/profile.dart';
import 'package:demo_call_api/title_page_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  final String username;
  final String id;
  final Map lists;
  const ProfilePage(this.title, {super.key, required this.username, required this.id, required this.lists});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

enum TestEnum { A }

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(username: widget.username, id: widget.id, lists: widget.lists,),
      appBar: const AppbarWidget(),
      body: Column(
        children: [
          TitlePageWidget(widget.title),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Profile(lists: widget.lists, id: widget.id),
                ],
              ),
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
