import 'package:demo_call_api/work_widgets/kanban_board_widgets/information.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 238, 221),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.5)
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("globits-hr#116"),
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Information(title: "Title: ", informationTasks: "informationTitle",),
                        Information(title: "Project: ", informationTasks: "informationProject",),
                        Information(title: "Activities: ", informationTasks: "informationActivities",),
                        Information(title: "Priority: ", informationTasks: "informationPriority",),
                        Information(title: "Role: ",informationTasks: "informationRole",),
                        Information(title: "Update time: ",informationTasks: "informationUpdateTime",),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
