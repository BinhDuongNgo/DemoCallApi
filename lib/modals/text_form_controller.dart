import 'package:flutter/material.dart';

class TextFormController extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool _isObscured;
  const TextFormController(this.name,this.controller,this._isObscured, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10,),
      child: TextFormField(
        obscureText: _isObscured,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          labelText: name,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            )
          ),
        ),
      ),
    );
  }
}

class TextFormControllerEdit extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final String hintText;
  const TextFormControllerEdit(this.name,this.controller,this.hintText, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: hintText,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          labelText: name,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            )
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            )
          ),
        ),
      ),
    );
  }
}