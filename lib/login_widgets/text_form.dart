import 'dart:convert';
import 'dart:ui';
import 'package:demo_call_api/login_widgets/login_text.dart';
import 'package:demo_call_api/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_call_api/modals/text_form_controller.dart';
import 'package:http/http.dart';

class TextForm extends StatefulWidget {
  const TextForm({super.key});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _token = '';

  void login(String username, String password) async {
    try {
      Response response = await post(
        Uri.parse(
            'https://auth.globits.net/auth/realms/HrPlatform/protocol/openid-connect/token'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': '*/*'
        },
        body: {
          'username': username,
          'password': password,
          'scope': 'openid',
          'grant_type': 'password',
          'client_id': 'admin-cli',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          _token = jsonResponse['access_token'];
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage("Home", token: _token),
          ),
        );
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = "Username";
    String password = "Password";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white30,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  LoginText(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormController(username, _usernameController, false),
                        TextFormController(password, _passwordController, true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        login(
                          _usernameController.text.toString(),
                          _passwordController.text.toString(),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
