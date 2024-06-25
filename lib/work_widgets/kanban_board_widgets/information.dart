import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String title;
  final String informationTasks;
  const Information({super.key, required this.title, required this.informationTasks});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: informationTasks,
          style: TextStyle(
            color: Colors.black
          )
        ),
      ]),
    );
  }
}
