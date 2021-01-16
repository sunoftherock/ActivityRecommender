import 'package:flutter/material.dart';
import 'dart:async';
import 'AppColors.dart';
import 'main.dart';
import 'model.dart';
import 'preferences.dart';
import 'result.dart';

AnimationController _animationController;

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400)
    );
    Timer(Duration(milliseconds: 200), () => _animationController.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      appBar: AppBar(
        title: Text("First Route"),
        backgroundColor: AppColors.blue,
      ),
      body: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.25),
          end: Offset.zero,
        ).animate(_animationController),
        child: FadeTransition(
          opacity: _animationController,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 270.0, 30.0, 0.0),
                      alignment: Alignment.center,
                      child: NameForm(),//Text("1 QUESTION",
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //     color: AppColors.white,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class NameForm extends StatefulWidget {
  @override
  _NameForm createState() => _NameForm();
}

class _NameForm extends State<NameForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 1.5;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            width: halfMediaWidth,
            decoration: new BoxDecoration(
              color: AppColors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(25.7)),
            ),
            child: MyFormField(
              hintText: "First Name",
              validator: (String value) {
                if(value.isEmpty) {
                  return "Enter your first name";
                }
                return null;
              },
              onSaved: (String value) {
                model.firstName = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
            width: halfMediaWidth,
            decoration: new BoxDecoration(
              color: AppColors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(25.7)),
            ),
            child: MyFormField(
              hintText: "Last Name",
              validator: (String value) {
                if(value.isEmpty) {
                  return "Enter your last name";
                }
                return null;
              },
              onSaved: (String value) {
                model.lastName = value;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 24.0),
            child: Center(
              child: FloatingActionButton.extended(
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(model: this.model)),
                    );
                  }
                },
                label: Text('Open route'),
                backgroundColor: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}