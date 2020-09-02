import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/ui/widgets/list_tasks.dart';
import 'package:task_master/ui/widgets/text_widgets.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Theme
                .of(context)
                .accentColor,
            child: Center(child: TextInsideTaskCard(
              "TASKS",
              size: 25, height: 4, textAlign: TextAlign.left,)),
          ),
        ),
        Expanded(
            flex: 5,
            child: ListView(
              children: ListTasks.tasksListView(Controller.getTasks()),
            )
        ),
      ],
    );
  }
}
