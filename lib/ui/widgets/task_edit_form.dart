import 'package:flutter/material.dart';
import 'package:task_master/model/task.dart';

class TaskEditDialog extends StatefulWidget {
  final Task task;
  final context;

  const TaskEditDialog({Key key, this.task, this.context}) : super(key: key);
  @override
  _TaskEditDialogState createState() => _TaskEditDialogState();
}

class _TaskEditDialogState extends State<TaskEditDialog> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = widget.task.title;
    description.text = widget.task.description;
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none, children: <Widget>[
        Positioned(
          right: -40.0,
          top: -40.0,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
              child: Icon(Icons.close),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        Form(
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
                  setState(() {
                    widget.task.title = title.text;
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Change"),
              ),
            ],
            ),
          ),
        ),
      ],
      ),
    );
  }
}