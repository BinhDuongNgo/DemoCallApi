import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuItem(this.title, this.icon, {Key? key, required this.onTap}): super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _isTapped ? Colors.grey : Color.fromRGBO(47, 79, 79, 1),
      ),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: Colors.white,
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          setState(() {
            _isTapped = true;
            widget.onTap();
            Future.delayed(Duration(milliseconds: 200), () {
              setState(() {
                _isTapped = false;
              });
            });
          });
        },
      ),
    );
  }
}
