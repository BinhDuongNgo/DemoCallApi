import 'package:demo_call_api/work_widgets/boards/board.dart';
import 'package:flutter/material.dart';

class KanbanBoardWidget extends StatefulWidget {
  final String token;
  final List list;
  final List countList;
  const KanbanBoardWidget(
      {super.key,
      required this.token,
      required this.list,
      required this.countList});

  @override
  State<KanbanBoardWidget> createState() => _KanbanBoardWidgetState();
}

class _KanbanBoardWidgetState extends State<KanbanBoardWidget> {
  late Map<String, List<Map<String, dynamic>>> _tasks;
  @override
  void initState() {
    super.initState();
    _initializeTasks();
  }

  Map<String, List<Map<String, dynamic>>> _initializeTasks() {
    _tasks = {
      'To do (${widget.countList[0]})': [],
      'Doing (${widget.countList[1]})': [],
      'Resolve (${widget.countList[2]})': [],
      'Feedback (${widget.countList[3]})': [],
      'Tested (${widget.countList[4]})': [],
      'Pending (${widget.countList[5]})': [],
      'Release Dev (${widget.countList[6]})': [],
      'Release Prod (${widget.countList[7]})': [],
      'Completed (${widget.countList[8]})': [],
    };
    for (var task in widget.list) {
      for (int i = 0; i < widget.list.length; i++) {
        if (task['statusName'] == 'To do') {
          _tasks['To do (${widget.countList[0]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Doing') {
          _tasks['Doing (${widget.countList[1]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Resolve') {
          _tasks['Resolve (${widget.countList[2]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Feedback') {
          _tasks['Feedback (${widget.countList[3]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Tested') {
          _tasks['Tested (${widget.countList[4]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Pending') {
          _tasks['Pending (${widget.countList[5]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Release Dev') {
          _tasks['Release Dev (${widget.countList[6]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Release Prod') {
          _tasks['Release Prod (${widget.countList[7]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Completed') {
          _tasks['Completed (${widget.countList[8]})']!.add(task);
          break;
        }
      }
    }
    Map<String, List<Map<String, dynamic>>> listsMap = _tasks;
    print(listsMap);
    return listsMap;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> tasks = _initializeTasks();
    return Boards(
      boards: tasks,
      list: widget.list,
      countList: widget.countList
    );
  }
}

// {
//   'To do': [],
//   'Doing': [
//     {
//       'id': '1'
//       'status': 'Doing'
//     },
//     {
//       'id': '2'
//       'status': 'Doing'
//     }
//   ],
//   'Done': [
//     {
//       'id': '3',
//       'status': 'Done'
//     }
//   ]
// }
