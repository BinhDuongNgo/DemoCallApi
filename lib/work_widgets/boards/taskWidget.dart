import 'package:flutter/material.dart';

typedef void DragEndCallback(DraggableDetails details);
typedef void DragUpdateCallback(DragUpdateDetails details);

class TaskWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback dragStartedCallback;
  final DragEndCallback dragEndCallback;
  final DragUpdateCallback dragUpdateCallback;
  final double width;

  const TaskWidget({
    super.key,
    required this.data,
    required this.dragStartedCallback,
    required this.dragEndCallback,
    required this.dragUpdateCallback,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<List<Map<String, dynamic>>>(
      data: [data],
      onDragStarted: dragStartedCallback,
      onDragEnd: dragEndCallback,
      onDragUpdate: dragUpdateCallback,
      feedback: Material(
        child: Container(
          width: width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
            color: Color.fromARGB(255, 239, 244, 226),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'globit-hr#${data['code']}',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 31, 134, 218)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 18,
                          ))
                    ],
                  ),
                  Text('${data['name']}'),
                  Text('Dự án: ${data['projectName']}'),
                  Text('Hoạt động: ${data['activity']}'),
                  Text('Phụ trách: ${data['assignee']}'),
                ],
              ),
            ),
          ),
        ),
      ),
      child: Container(
        width: width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          color: Color.fromARGB(255, 239, 244, 226),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'globit-hr#${data['code']}',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 31, 134, 218)),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 18,
                        ))
                  ],
                ),
                Text('${data['name']}'),
                Text('Dự án: ${data['projectName']}'),
                Text('Hoạt động: ${data['activity']}'),
                Text('Phụ trách: ${data['assignee']}'),
              ],
            ),
          ),
        ),
      ),
      childWhenDragging: Container(),
    );
  }
}
