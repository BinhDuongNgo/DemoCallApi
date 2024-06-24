import 'package:demo_call_api/pages/login_page.dart';
import 'package:demo_call_api/pages/profile_page.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final String username;
  final String id;
  final Map lists;
  const User({super.key, required this.username, required this.id, required this.lists});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.lists['fullname'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.purple.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage("Profile", username: widget.username, id: widget.id, lists: widget.lists)));
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orange.shade100,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
