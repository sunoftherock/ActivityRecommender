import 'package:flutter/material.dart';
import 'model.dart';

class Result extends StatelessWidget {
  Model model;

  Result({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Successful"),),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              model.firstName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.lastName,
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
      )
    );
  }
}