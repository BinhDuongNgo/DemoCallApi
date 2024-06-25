import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:demo_call_api/work_widgets/kanban_board_widgets/header.dart';
import 'package:demo_call_api/work_widgets/kanban_board_widgets/item.dart';
import 'package:flutter/material.dart';

class KanbanBoardWidget extends StatefulWidget {
  final String token;
  const KanbanBoardWidget({Key? key, required this.token}) : super(key: key);

  @override
  State<KanbanBoardWidget> createState() => _KanbanBoardWidgetState();
}

class _KanbanBoardWidgetState extends State<KanbanBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return BoardView(
      lists: [
        BoardList(
          header: [
            Header(title: "To do",numberOfTasks: " (3)",),
          ],
          items: [
            BoardItem(
              item: Item(),
            ),
          ],
        ),
        BoardList(
          header: [
            Header(title: "To do",numberOfTasks: " (3)",),
          ],
          items: [
            BoardItem(
              item: Item(),
            ),
          ],
        ),
      ],
    );
  }
}

