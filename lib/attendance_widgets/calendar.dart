import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceCalendar extends StatefulWidget {
  final String id;
  final Map lists;
  const AttendanceCalendar({super.key, required this.id, required this.lists});

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isTodayHighlighted = true;
  Map<DateTime, List<String>> _tasks = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    isTodayHighlighted = true;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _showPopup(context, selectedDay);
      });
    }
  }

  void _showPopup(BuildContext context, DateTime selectedDay) {
    TextEditingController taskController = TextEditingController();

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Selected Day'),
    //       content: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text('You selected ${selectedDay.toLocal()}'),
    //           TextField(
    //             controller: taskController,
    //             decoration: InputDecoration(labelText: 'Enter task'),
    //           ),
    //         ],
    //       ),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //             setState(() {
    //               isTodayHighlighted = false; // Cập nhật trạng thái đúng cách
    //             });
    //           },
    //           child: Text('Close'),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //             if (taskController.text.isNotEmpty) {
    //               setState(() {
    //                 if (_tasks[selectedDay] != null) {
    //                   _tasks[selectedDay]!.add(taskController.text);
    //                 } else {
    //                   _tasks[selectedDay] = [taskController.text];
    //                 }
    //               });
    //             }
    //           },
    //           child: Text('Add Task'),
    //         ),
    //       ],
    //     );
    //   },
    // );

    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          daysOfWeekVisible: false,
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2099, 1, 1),
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: _onDaySelected,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            isTodayHighlighted: isTodayHighlighted,
          ),
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (_tasks[date] != null && _tasks[date]!.isNotEmpty) {
                return Positioned(
                  right: 1,
                  bottom: 1,
                  child: _buildTasksMarker(date, _tasks[date]!.length),
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTasksMarker(DateTime date, int taskCount) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '$taskCount',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
