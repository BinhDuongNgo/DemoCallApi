import 'package:demo_call_api/appbar_widget.dart';
import 'package:demo_call_api/attendance_widgets/calendar.dart';
import 'package:demo_call_api/drawer_widgets/drawer.dart';
import 'package:demo_call_api/footer_widget.dart';
import 'package:demo_call_api/title_page_widget.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  final String title;
  final String username;
  final String id;
  final Map lists;
  const AttendancePage(this.title, {super.key, required this.username, required this.id, required this.lists});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(username: widget.username, id: widget.id, lists: widget.lists,),
      appBar: const AppbarWidget(),
      body: Column(
        children: [
          TitlePageWidget(widget.title),
          Expanded(
            child: AttendanceCalendar(lists: widget.lists, id: widget.id),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
