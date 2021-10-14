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
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onFieldSubmitted: (_) => submit(context),
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!value!.contains("@") || !value.contains(".")) {
                    return 'Please Enter a Valid Email';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () => submit(context)
                  , child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }

  submit(context){
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}