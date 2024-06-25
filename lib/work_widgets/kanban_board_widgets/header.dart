import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String numberOfTasks;
  const Header({super.key, required this.title, required this.numberOfTasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.06,
      color: Color.fromARGB(255, 39, 90, 41),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              numberOfTasks,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
