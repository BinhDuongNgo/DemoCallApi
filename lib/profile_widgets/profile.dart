import 'package:demo_call_api/profile_widgets/employee.dart';
import 'package:demo_call_api/profile_widgets/personal.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final Map lists;
  final String id;
  const Profile({super.key, required this.lists, required this.id});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalInformationElement(lists: widget.lists, id: widget.id),
        EmployeeInformationElement(lists: widget.lists, id: widget.id),
      ],
    );
  }
}
