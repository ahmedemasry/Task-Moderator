import 'package:flutter/material.dart';
import 'package:task_master/ui/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (!value.contains("@") || !value.contains(".")) {
                    return 'Please Enter a Valid Email';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              }, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}