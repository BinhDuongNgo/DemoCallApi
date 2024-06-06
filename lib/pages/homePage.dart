// ignore_for_file: depend_on_referenced_packages
import 'package:demo_call_api/modals/cartModal.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Cart? cart;
  Future<void> getData() async {
    const String apiUrl = "https://dummyjson.com/carts";
    try {
      Response response = await Dio().get(apiUrl);
      if (response.data != null) {
        setState(
          () {
            cart = Cart.fromJson(response.data);
          },
        );
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Demo Call Api",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: cart == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        cart!.carts![index].products![0].thumbnail ?? "",
                        height: 140,
                        width: 200,
                      ),
                      Text(
                        cart!.carts![index].products![0].title ?? "",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              itemCount: cart!.carts!.length,
            ),
    );
  }
}
