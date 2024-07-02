import 'dart:async';
import 'dart:math';
import 'package:demo_call_api/work_widgets/boards/taskWidget.dart';
import 'package:flutter/material.dart';

class Boards extends StatefulWidget {
  final Map<String, List<Map<String, dynamic>>> boards;
  final List list;
  final List countList;
  final bool isLoading;
  const Boards(
      {super.key,
      required this.boards,
      required this.list,
      required this.countList,
      required this.isLoading});
  @override
  _BoardsState createState() => _BoardsState();
}

class _BoardsState extends State<Boards> {
  var dragging = false;
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  final double _scrollSpeed = 10.0;
  final double _scrollThreshold = 50.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(
            children: widget.boards.keys
                .map((name) => DragTarget<Map<String, dynamic>>(
                      onWillAccept: (data) => true,
                      onAccept: (data) {
                        setState(() {
                          removeTaskFromBoards(widget.boards, data);
                          widget.boards[name]?.add(data);
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.06,
                              color: Color.fromARGB(255, 39, 90, 41),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                children: <Widget>[
                                  ...widget.boards[name]!.map(
                                    (t) => widget.isLoading
                                        ? CircularProgressIndicator()
                                        : TaskWidget(
                                            data: t,
                                            dragStartedCallback: () =>
                                                setState(() => dragging = true),
                                            dragEndCallback: (details) {
                                              setState(() => dragging = false);
                                              _scrollTimer?.cancel();
                                            },
                                            dragUpdateCallback: _autoScroll,
                                            width: max(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
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
    );
  }

  void removeTaskFromBoards(Map<String, List<Map<String, dynamic>>> boards,
      Map<String, dynamic> taskToRemove) {
    boards.forEach((key, list) {
      list.removeWhere(
          (task) => task['statusName'] == taskToRemove['statusName']);
    });
  }

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
}
