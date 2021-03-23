import 'package:flutter/material.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/ui/screens/home_screen.dart';

class EditScreen extends StatelessWidget {
  final Task task;

  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  EditScreen({Key key, this.task}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    title.text = task.title;
    description.text = task.description;
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              TextFormField(
                controller: title,

                validator: (value) => value.isEmpty?'You Must Enter Title':null,
                decoration: InputDecoration(hintText: 'Task Title'),
//                onChanged: (value) => widget.task.title = title.text,
              ),
              TextButton(
                onPressed: () {
                  task.title = title.text;
                  Navigator.of(context).pop(task);
                  // setState(() {
                  //   task.title = title.text;
                  // });
                },
                child: Text("Change"),
              ),
            ],
            ),
          ),
        ),
      ),


    );
  }
}
