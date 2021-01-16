import 'package:flutter/material.dart';
import 'package:hackthenorthapp/AppColors.dart';
import 'package:validators/validators.dart' as validator;
import 'model.dart';
import 'result.dart';
import 'namepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Basics',
      home: FirstRoute(),
    );
  }
}

class MyFormField extends StatelessWidget {
  final String hintText;
  final Function onSaved;
  final Function validator;
  final bool isEmail;
  final bool isPassword;

  MyFormField({
    this.hintText,
    this.onSaved,
    this.validator,
  this.isEmail = false,
  this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0),
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}