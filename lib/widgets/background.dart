import 'package:demo_call_api/login_widgets/logo.dart';
import 'package:demo_call_api/login_widgets/signin_button.dart';
import 'package:demo_call_api/login_widgets/text_form.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Logo(),
              TextForm(),
              SignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
