import 'dart:convert';
import 'dart:ui';
import 'package:demo_call_api/login_widgets/login_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_call_api/pages/home_page.dart';
import 'package:demo_call_api/modals/text_form_controller.dart';

class TextForm extends StatefulWidget {
  const TextForm({super.key});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String username = "Username";
    String password = "Password";
    String login = "LOGIN";
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginText(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormController(username, _usernameController),
                          TextFormController(password, _passwordController),
                        ],
                      ),
                    ),
                    _ButtonModal(context, login),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ButtonModal(BuildContext context, String login) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          onTap: () {
            _login(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                login,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    var url = Uri.parse('https://666950f72e964a6dfed49ec0.mockapi.io/list');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var users = json.decode(response.body) as List;
        bool isAuthenticated = false;
        Map list = {};
        String id = '';

        for (var user in users) {
          if (user['username'] == _usernameController.text &&
              user['password'] == _passwordController.text) {
            isAuthenticated = true;
            list = user['information'];
            id = user['id'];
            break;
          }
        }

        if (isAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login successful!')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                "Home",
                username: _usernameController.text,
                lists: list,
                id: id,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid username or password')),
          );
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to the server')),
      );
    }
  }
}
