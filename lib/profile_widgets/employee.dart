import 'package:demo_call_api/profile_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmployeeInformationElement extends StatefulWidget {
  final Map lists;
  final String id;
  const EmployeeInformationElement({super.key, required this.lists, required this.id});

  @override
  State<EmployeeInformationElement> createState() => _EmployeeInformationElementState();
}

class _EmployeeInformationElementState extends State<EmployeeInformationElement> {
  late String _address;
  late String _idEmployee;
  late String _status;
  late String _work;
  @override
  void initState() {
    _address = widget.lists['address'];
    _idEmployee = widget.lists['idEmployee'];
    _status = widget.lists['status'];
    _work = widget.lists['work'];
    super.initState();
  }
  void updateInformation(Map updatedInfo) {
    setState(() {
      _address = widget.lists['address'];
      _idEmployee = widget.lists['idEmployee'];
      _status = widget.lists['status'];
      _work= widget.lists['work'];
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
                title: "Thông tin hồ sơ nhân viên",
                color: Colors.blue.shade500,
                lists: widget.lists,
                id: widget.id,
                updateInformationCallback: updateInformation,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWidgetTitles(title: "Địa chỉ: "),
                        TextWidgetTitles(title: "Mã nhân viên: "),
                        TextWidgetTitles(title: "Trạng thái nhân viên: "),
                        TextWidgetTitles(title: "Tình trạng hôn nhân: "),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWidgetInfor(title: _address),
                        TextWidgetInfor(title: _idEmployee),
                        TextWidgetInfor(title: _status),
                        TextWidgetInfor(title: _work),
                      ],
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
