import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashBoardWidget(
          context,
          Icons.person,
          "124",
          "Tổng số nhân viên",
          Colors.green,
          const Color.fromARGB(255, 0, 255, 132),
        ),
        DashBoardWidget(
          context,
          Icons.menu,
          "43",
          "Tổng dự án",
          Colors.pink,
          const Color.fromARGB(255, 255, 0, 85),
        ),
        DashBoardWidget(
          context,
          Icons.note,
          "709",
          "Đầu việc trong tháng",
          Colors.blue,
          const Color.fromARGB(255, 0, 140, 255),
        ),
        DashBoardWidget(
          context,
          Icons.star,
          "43",
          "Tổng lương trong tháng",
          Colors.yellow,
          const Color.fromARGB(255, 255, 230, 0),
        ),
      ],
    );
  }

  Widget DashBoardWidget(
    BuildContext context,
    IconData icon,
    String number,
    String title,
    Color colorText,
    Color colorBack,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(2.0, 2.0),
                blurRadius: 10,
                spreadRadius: 1.0,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0, -2.0),
                blurRadius: 10,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorBack.withOpacity(0.1),
                  ),
                  child: Icon(
                    icon,
                    size: 15,
                    color: colorText,
                  ),
                ),
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorText,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorText,
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
