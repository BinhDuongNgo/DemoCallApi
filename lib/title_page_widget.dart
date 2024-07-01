
import 'package:flutter/material.dart';
class TitlePageWidget extends StatelessWidget {
  final String title;
  const TitlePageWidget(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text("Trang chủ "),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitlePageWidgetWork extends StatefulWidget {
  final String title;
  final String token;
  const TitlePageWidgetWork(this.title, this.token, {super.key});

  @override
  State<TitlePageWidgetWork> createState() => _TitlePageWidgetWorkState();
}

class _TitlePageWidgetWorkState extends State<TitlePageWidgetWork> {
  // void getList(String token) async {
  //   try {
  //     Response response = await post(
  //       Uri.parse('https://hr-api.globits.net/api/hr-task/get-list-by-limit'),
  //       headers: {
  //         "Access-Control-Allow-Origin": "*",
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode({
  //         "increasingCodeOrder": false,
  //         "increasingPriorityOrder": false,
  //         "increasingLastModifyDate": false,
  //         "pageIndex": 1,
  //         "pageSize": 10,
  //         "tasksOfAllProjects": true,
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       var lists = json.decode(response.body) as List;
  //     } else {
  //       // print('error');
  //       print('Error');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // getList(widget.token);
                  },
                  child: Text(
                    "Load Kanban",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Trang chủ "),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey,
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
