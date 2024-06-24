import 'dart:convert';

import 'package:demo_call_api/modals/text_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DialogEditEmployee extends StatefulWidget {
  final Map lists;
  final String id;
  const DialogEditEmployee({super.key, required this.lists, required this.id});

  @override
  State<DialogEditEmployee> createState() => _DialogEditEmployeeState();
}

class _DialogEditEmployeeState extends State<DialogEditEmployee> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _idEmployeeController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _workController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addressController.text = widget.lists['address'];
    _idEmployeeController.text = widget.lists['idEmployee'];
    _statusController.text = widget.lists['status'];
    _workController.text = widget.lists['work'];
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
          'fullname': widget.lists['fullname'],
          'gender': widget.lists['gender'],
          'phone number': widget.lists['phone number'],
          'email': widget.lists['email'],
          'address': _addressController.text,
          'idEmployee': _idEmployeeController.text,
          'status': _statusController.text,
          'work': _workController.text,
        }
      }),
    );

    if (response.statusCode == 200) {
      widget.lists['address'] = _addressController.text;
      widget.lists['idEmployee'] = _idEmployeeController.text;
      widget.lists['status'] = _statusController.text;
      widget.lists['work'] = _workController.text;
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
                      'Update Information employee',
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
                        TextFormControllerEdit("Địa chỉ", _addressController,
                            widget.lists['address']),
                        TextFormControllerEdit(
                            "Mã nhân viên", _idEmployeeController, widget.lists['idEmployee']),
                        TextFormControllerEdit("Trạng thái nhân viên",
                            _statusController, widget.lists['status']),
                        TextFormControllerEdit(
                            "Tình trạng hôn nhân", _workController, widget.lists['work']),
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

