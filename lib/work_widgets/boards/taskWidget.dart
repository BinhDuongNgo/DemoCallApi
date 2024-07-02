
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
    return LongPressDraggable<Map<String, dynamic>>(
      data: data,
      onDragStarted: dragStartedCallback,
      onDragEnd: dragEndCallback,
      onDragUpdate: dragUpdateCallback,
      feedback: Material(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.25,
          color: Color.fromARGB(255, 239, 244, 226),
          child: Card(
            color: Color.fromARGB(255, 239, 244, 226),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            'globit-hr#${data['code']}',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 31, 134, 218),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${data['name']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Dự án: ${data['projectName']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Hoạt động: ${data['activity']}',
                            maxLines: 1,
                          ),
                          Text(
                            'Phụ trách: ${data['assignee']}',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      childWhenDragging: Container(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Card(
            color: Color.fromARGB(255, 239, 244, 226),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            'globit-hr#${data['code']}',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 31, 134, 218),
                            ),
                            maxLines: 1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${data['name']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Dự án: ${data['projectName']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Hoạt động: ${data['activity']}',
                            maxLines: 1,
                          ),
                          Text(
                            'Phụ trách: ${data['assignee']}',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
