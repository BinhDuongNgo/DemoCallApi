import 'package:demo_call_api/profile_widgets/dialog_edit_profiles/dialog_edit_employee.dart';
import 'package:demo_call_api/profile_widgets/dialog_edit_profiles/dialog_edit_personal.dart';
import 'package:flutter/material.dart';

class TextWidgetInfor extends StatelessWidget {
  final String title;
  const TextWidgetInfor({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextWidgetTitles extends StatelessWidget {
  final String title;
  const TextWidgetTitles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextWidgetTitle extends StatelessWidget {
  final String title;
  final Color color;
  final Map lists;
  final String id;
  final Function(Map) updateInformationCallback;
  const TextWidgetTitle({super.key, required this.title, required this.color, required this.lists, required this.id, required this.updateInformationCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (title == "Thông tin cá nhân") {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogEditPersonal(lists: lists, id: id);
                  },
                );
                if (result == true) {
                  updateInformationCallback({
                    'fullname': lists['fullname'],
                    'gender': lists['gender'],
                    'phone number': lists['phone number'],
                    'email': lists['email'],
                  });
                }
              } else if (title == "Thông tin hồ sơ nhân viên") {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogEditEmployee(lists: lists, id: id);
                  },
                );
                if (result == true) {
                  updateInformationCallback({
                    'address': lists['address'],
                    'idEmployee': lists['idEmployee'],
                    'status': lists['status'],
                    'work': lists['work'],
                  });
                }
              }
            },
            icon: Icon(Icons.edit,size: 20,),
          ),
        ],
      ),
    );
  }
}


