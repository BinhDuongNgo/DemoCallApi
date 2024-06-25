import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Footer(
      padding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade300,
              ),
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.05,
              child: const Center(
                child: Text(
                  "@Globits",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: const Center(
              child: Text(
                "Developed by Globits",
                style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
