import 'package:demo_call_api/profile_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PersonalInformationElement extends StatefulWidget {
  final Map lists;
  final String id;
  const PersonalInformationElement({super.key, required this.lists, required this.id});

  @override
  State<PersonalInformationElement> createState() => _PersonalInformationElementState();
}

class _PersonalInformationElementState extends State<PersonalInformationElement> {
  late String _fullname;
  late String _gender;
  late String _phoneNumber;
  late String _email;
  @override
  void initState() {
    _fullname = widget.lists['fullname'];
    _gender = widget.lists['gender'];
    _phoneNumber = widget.lists['phone number'];
    _email = widget.lists['email'];
    super.initState();
  }
  void updateInformation(Map updatedInfo) {
    setState(() {
      _fullname = widget.lists['fullname'];
      _gender = widget.lists['gender'];
      _phoneNumber = widget.lists['phone number'];
      _email = widget.lists['email'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgetTitle(
                title: "Thông tin cá nhân",
                color: Colors.blue.shade500,
                lists: widget.lists,
                id: widget.id,
                updateInformationCallback: updateInformation,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidgetTitles(title: "Họ và tên: "),
                          TextWidgetTitles(title: "Giới tính: "),
                          TextWidgetTitles(title: "Số điện thoại: "),
                          TextWidgetTitles(title: "Email: "),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidgetInfor(title: _fullname),
                          TextWidgetInfor(title: _gender),
                          TextWidgetInfor(title: _phoneNumber),
                          TextWidgetInfor(title: _email),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
