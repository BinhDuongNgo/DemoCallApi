import 'dart:async';
import 'dart:convert';

import 'package:demo_call_api/work_widgets/boards/board.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class KanbanBoardWidget extends StatefulWidget {
  final String token;
  const KanbanBoardWidget(
      {super.key,
      required this.token,});

  @override
  State<KanbanBoardWidget> createState() => _KanbanBoardWidgetState();
}

class _KanbanBoardWidgetState extends State<KanbanBoardWidget> {
  late Map<String, List<Map<String, dynamic>>> _tasks;
  List<dynamic> _list = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _initializeTasks();
    _getList(widget.token);
    _getTask(_list);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> tasks = _initializeTasks();
    return Boards(boards: tasks, list: _list, countList: _getTask(_list), isLoading: isLoading);
  }

  Future<List<dynamic>> _getList(String token) async {
    try {
      Response response = await post(
        Uri.parse('https://hr-api.globits.net/api/hr-task/get-list-by-limit'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "increasingCodeOrder": false,
          "increasingPriorityOrder": false,
          "increasingLastModifyDate": false,
          "pageIndex": 1,
          "pageSize": 10,
          "tasksOfAllProjects": true,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          _list = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
          isLoading = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }
    return _list;
  }

  List<dynamic> _getTask(List _list){
    int countToDo = 0;
    int countDoing = 0;
    int countResolve = 0;
    int countFeedback = 0;
    int countTested = 0;
    int countPending = 0;
    int countReleasedDev = 0;
    int countReleasedProd = 0;
    int countCompleted = 0;
    List<int> _countList = [];

    for (var item in _list) {
      if (item["statusName"] == "To do") {
        countToDo++;
      } else if (item["statusName"] == "Doing") {
        countDoing++;
      } else if (item["statusName"] == "Resolve") {
        countResolve++;
      } else if (item["statusName"] == "Feedback") {
        countFeedback++;
      } else if (item["statusName"] == "Tested") {
        countTested++;
      } else if (item["statusName"] == "Pending") {
        countPending++;
      } else if (item["statusName"] == "Released Dev") {
        countReleasedDev++;
      } else if (item["statusName"] == "Released Prod") {
        countReleasedProd++;
      } else if (item["statusName"] == "Completed") {
        countCompleted++;
      }
    }

    _countList.add(countToDo);
    _countList.add(countDoing);
    _countList.add(countResolve);
    _countList.add(countFeedback);
    _countList.add(countTested);
    _countList.add(countPending);
    _countList.add(countReleasedDev);
    _countList.add(countReleasedProd);
    _countList.add(countCompleted);

    return _countList;
  }

  Map<String, List<Map<String, dynamic>>> _initializeTasks() {
    _tasks = {
      'To do (${_getTask(_list)[0]})': [],
      'Doing (${_getTask(_list)[1]})': [],
      'Resolve (${_getTask(_list)[2]})': [],
      'Feedback (${_getTask(_list)[3]})': [],
      'Tested (${_getTask(_list)[4]})': [],
      'Pending (${_getTask(_list)[5]})': [],
      'Release Dev (${_getTask(_list)[6]})': [],
      'Release Prod (${_getTask(_list)[7]})': [],
      'Completed (${_getTask(_list)[8]})': [],
    };
    for (var task in _list) {
      for (int i = 0; i < _list.length; i++) {
        if (task['statusName'] == 'To do') {
          _tasks['To do (${_getTask(_list)[0]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Doing') {
          _tasks['Doing (${_getTask(_list)[1]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Resolve') {
          _tasks['Resolve (${_getTask(_list)[2]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Feedback') {
          _tasks['Feedback (${_getTask(_list)[3]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Tested') {
          _tasks['Tested (${_getTask(_list)[4]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Pending') {
          _tasks['Pending (${_getTask(_list)[5]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Release Dev') {
          _tasks['Release Dev (${_getTask(_list)[6]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Release Prod') {
          _tasks['Release Prod (${_getTask(_list)[7]})']!.add(task);
          break;
        } else if (task['statusName'] == 'Completed') {
          _tasks['Completed (${_getTask(_list)[8]})']!.add(task);
          break;
        }
      }
    }
    Map<String, List<Map<String, dynamic>>> listsMap = _tasks;
    return listsMap;
  }
}
