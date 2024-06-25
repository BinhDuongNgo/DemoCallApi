
import 'package:demo_call_api/appbar_widget.dart';
import 'package:demo_call_api/home_widgets/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:demo_call_api/drawer_widgets/drawer.dart';
import 'package:demo_call_api/footer_widget.dart';
import 'package:demo_call_api/title_page_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  final String token;
  const HomePage(this.title, {super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(token: widget.token,),
      appBar: AppbarWidget(),
      body: Column(
        children: [
          TitlePageWidget(widget.title),
          const Expanded(
            child: SingleChildScrollView(
              child: DashBoard(),
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
