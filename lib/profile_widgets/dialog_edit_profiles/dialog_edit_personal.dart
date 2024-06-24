import 'dart:convert';

import 'package:demo_call_api/modals/text_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DialogEditPersonal extends StatefulWidget {
  final Map lists;
  final String id;
  const DialogEditPersonal({super.key, required this.lists, required this.id});

  @override
  State<DialogEditPersonal> createState() => _DialogEditPersonalState();
}

class _DialogEditPersonalState extends State<DialogEditPersonal> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullnameController.text = widget.lists['fullname'];
    _genderController.text = widget.lists['gender'];
    _phoneNumberController.text = widget.lists['phone number'];
    _emailController.text = widget.lists['email'];
  }

  Future<void> updateUserInfo() async {
    final url = 'https://666950f72e964a6dfed49ec0.mockapi.io/list/${widget.id}';
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'information': {
          'fullname': _fullnameController.text,
          'gender': _genderController.text,
          'phone number': _phoneNumberController.text,
          'email': _emailController.text,
          'address': widget.lists['address'],
          'idEmployee': widget.lists['idEmployee'],
          'status': widget.lists['status'],
          'work': widget.lists['work'],
        }
      }),
    );

    if (response.statusCode == 200) {
      widget.lists['fullname'] = _fullnameController.text;
      widget.lists['gender'] = _genderController.text;
      widget.lists['phone number'] = _phoneNumberController.text;
      widget.lists['email'] = _emailController.text;
      Navigator.of(context).pop(true);
    } else {
      throw Exception('Failed to update user info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Update Information personal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormControllerEdit("Họ và tên", _fullnameController,
                            widget.lists['fullname']),
                        TextFormControllerEdit(
                            "Giới tính", _genderController, widget.lists['gender']),
                        TextFormControllerEdit("Số điện thoại",
                            _phoneNumberController, widget.lists['phone number']),
                        TextFormControllerEdit(
                            "Email", _emailController, widget.lists['email']),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () async {
                            await updateUserInfo();
                          },
                          child: Text(
                            'SAVE',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'CLOSE',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
