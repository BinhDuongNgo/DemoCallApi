import 'dart:convert';

import 'package:demo_call_api/pages/work_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_call_api/drawer_widgets/menu_item.dart';
import 'package:demo_call_api/pages/home_page.dart';
import 'package:http/http.dart';

class BuildMenuItem extends StatefulWidget {
  final String token;
  const BuildMenuItem({super.key, required this.token});

  @override
  State<BuildMenuItem> createState() => _BuildMenuItemState();
}

class _BuildMenuItemState extends State<BuildMenuItem> {
  List<dynamic> list = [];
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  void getList(String token) async {
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
        list = json.decode(response.body) as List<dynamic>;
        print("List: $list");
        _navigateTo(context, WorkPage("Work", token: widget.token, list: list, countList: getTask(list)));
      } else {
        print('Error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<dynamic> getTask(List list) {
    int countToDo = 0;
    int countDoing = 0;
    int countResolve = 0;
    int countFeedback = 0;
    int countTested = 0;
    int countPending = 0;
    int countReleasedDev = 0;
    int countReleasedProd = 0;
    int countCompleted = 0;
    List<int> countList = [];

    for (var item in list) {
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

    countList.add(countToDo);
    countList.add(countDoing);
    countList.add(countResolve);
    countList.add(countFeedback);
    countList.add(countTested);
    countList.add(countPending);
    countList.add(countReleasedDev);
    countList.add(countReleasedProd);
    countList.add(countCompleted);

    return countList;
  }

  @override
  Widget build(BuildContext context) {
    String home = "Home";
    String work = "Work";
    return Container(
      child: Wrap(
        children: [
          MenuItem(
            home,
            Icons.home,
            onTap: () =>
                _navigateTo(context, HomePage(home, token: widget.token)),
          ),
          MenuItem(
            work,
            Icons.task,
            onTap: () {
              getList(widget.token);
            },
          ),
        ],
      ),
    );
  }
}
