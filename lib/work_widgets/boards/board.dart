// import 'dart:async';
// import 'dart:math';
// import 'package:demo_call_api/work_widgets/boards/taskWidget.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class Boards extends StatefulWidget {
//   final Map<String, List<Map<String, dynamic>>> boards;
//   final List list;
//   final List countList;
//   const Boards(
//       {super.key,
//       required this.boards,
//       required this.list,
//       required this.countList});
//   @override
//   _BoardsState createState() => _BoardsState();
// }

// class _BoardsState extends State<Boards> {
//   var dragging = false;
//   final ScrollController _scrollController = ScrollController();
//   Timer? _scrollTimer;
//   Timer? _scrollContinuousTimer;

//   void _autoScroll(DragUpdateDetails details) {
//     const double scrollThreshold = 50.0; // Ngưỡng cuộn
//     const double scrollSpeed = 10.0; // Tốc độ cuộn
//     final double position = details.globalPosition.dx;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     // Cuộn trái khi chạm viền bên trái
//     if (position < scrollThreshold && _scrollController.offset > 0) {
//       _startScrollTimer(() => _scrollController.jumpTo(max(0, _scrollController.offset - scrollSpeed)));
//     }
//     // Cuộn phải khi chạm viền bên phải
//     else if (position > screenWidth - scrollThreshold &&
//              _scrollController.offset < _scrollController.position.maxScrollExtent) {
//       _startScrollTimer(() => _scrollController.jumpTo(min(_scrollController.position.maxScrollExtent,
//                                                             _scrollController.offset + scrollSpeed)));
//     }
//     else {
//       _scrollTimer?.cancel();
//     }
//   }

//   void _startScrollTimer(VoidCallback scrollAction) {
//     _scrollTimer?.cancel();
//     _scrollTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
//       if (dragging) {
//         scrollAction();
//       } else {
//         timer.cancel();
//       }
//     });

//     // Bắt đầu cuộn liên tục
//     _scrollContinuousTimer?.cancel();
//     _scrollContinuousTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
//       if (dragging) {
//         scrollAction();
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollTimer?.cancel();
//     _scrollContinuousTimer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: widget.boards.keys
//             .map(
//               (name) => DragTarget<List<String>>(
//                 onWillAccept: (data) => true,
//                 onAccept: (data) {
//                   setState(() {
//                     widget.boards[data[1]]?.remove(data[0]);
//                     // _tasks[name]?.add(data[0]);
//                   });
//                 },
//                 builder: (context, candidateData, rejectedData) => Container(
//                   margin: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   width: max(
//                     MediaQuery.of(context).size.width /
//                         widget.boards.keys.length,
//                     250,
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(8.0),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               name,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.add,
//                                   size: 15,
//                                   color: Colors.white,
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView(
//                           children: <Widget>[
//                             ...widget.boards[name]!
//                                 .map(
//                                   (task) => TaskWidget(
//                                     width: max(
//                                         MediaQuery.of(context).size.width /
//                                             widget.boards.keys.length,
//                                         250),
//                                     data: task,
//                                     dragStartedCallback: () {
//                                       setState(() {
//                                         dragging = true;
//                                       });
//                                     },
//                                     dragEndCallback: (details) {
//                                       setState(() {
//                                         dragging = false;
//                                       });
//                                       _scrollTimer?.cancel();
//                                       _scrollContinuousTimer?.cancel();
//                                     },
//                                     dragUpdateCallback: _autoScroll,
//                                   ),
//                                 )
//                                 .toList(),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:math';
import 'package:demo_call_api/work_widgets/boards/taskWidget.dart';
import 'package:flutter/material.dart';

class Boards extends StatefulWidget {
  final Map<String, List<Map<String, dynamic>>> boards;
  final List list;
  final List countList;
  const Boards(
      {super.key,
      required this.boards,
      required this.list,
      required this.countList});
  @override
  _BoardsState createState() => _BoardsState();
}

class _BoardsState extends State<Boards> {
  var dragging = false;
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  final double _scrollSpeed = 10.0;
  final double _scrollThreshold = 50.0;

  void _autoScroll(DragUpdateDetails details) {
    if (!dragging) return;
    final double position = details.globalPosition.dx;
    final double screenWidth = MediaQuery.of(context).size.width;

    if (position < _scrollThreshold && _scrollController.offset > 0) {
      // Cuộn trái
      _startScrollTimer(() {
        _scrollController
            .jumpTo(max(0, _scrollController.offset - _scrollSpeed));
      });
    } else if (position > screenWidth - _scrollThreshold &&
        _scrollController.offset < _scrollController.position.maxScrollExtent) {
      // Cuộn phải
      _startScrollTimer(() {
        _scrollController.jumpTo(min(_scrollController.position.maxScrollExtent,
            _scrollController.offset + _scrollSpeed));
      });
    } else {
      _scrollTimer?.cancel();
    }
  }

  void _startScrollTimer(VoidCallback scrollAction) {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      if (dragging) {
        scrollAction();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              children: widget.boards.keys
                  .map((name) => DragTarget<List<String>>(
                        onWillAccept: (data) => true,
                        onAccept: (data) {
                          setState(() {
                            widget.boards[data[1]]?.remove(data[0]);
                          });
                        },
                        builder: (context, candidateData, rejectedData) =>
                            Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          width: max(
                              MediaQuery.of(context).size.width /
                                  widget.boards.keys.length,
                              250),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: const EdgeInsets.all(8.0),
                                  children: <Widget>[
                                    ...widget.boards[name]!.map(
                                      (t) => TaskWidget(
                                        data: t,
                                        dragStartedCallback: () =>
                                            setState(() => dragging = true),
                                        dragEndCallback: (details) {
                                          setState(() => dragging = false);
                                          _scrollTimer?.cancel();
                                        },
                                        dragUpdateCallback: _autoScroll,
                                        width: max(
                                            MediaQuery.of(context).size.width /
                                                widget.boards.keys.length,
                                            250),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
