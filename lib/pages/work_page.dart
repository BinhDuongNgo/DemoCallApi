import 'package:demo_call_api/appbar_widget.dart';
import 'package:demo_call_api/drawer_widgets/drawer.dart';
import 'package:demo_call_api/footer_widget.dart';
import 'package:demo_call_api/title_page_widget.dart';
import 'package:demo_call_api/work_widgets/kanban_board.dart';
import 'package:flutter/material.dart';


class WorkPage extends StatefulWidget {
  final String title;
  final String token;
  const WorkPage(this.title, {super.key, required this.token});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: DrawerWidget(token: widget.token,),
        appBar: const AppbarWidget(),
        body: Column(
          children: [
            TitlePageWidgetWork(widget.title, widget.token),
            Expanded(
              child: KanbanBoardWidget(token: widget.token),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
