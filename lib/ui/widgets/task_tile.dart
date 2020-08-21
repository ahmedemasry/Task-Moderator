import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';
import 'package:task_master/utils/constants.dart';

import 'task_card.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String client;
  final String description;
  final remainingTasks;
  final doneTasks;
  final Task task;
  final bool showUserName;

  TaskTile({
    Key key,
    @required this.title,
    @required this.client,
    this.description = "",
    this.remainingTasks = 0,
    this.doneTasks = 0,
    this.task,
    this.showUserName = false,
  }) : super(key: key);

  @override
  TaskTile.withTask(Task task, {showUserName})
      : this(
            title: task.title,
            description: task.description ?? "",
            client: task.client.title,
            task: task,
            showUserName: showUserName ?? false);

  Widget build(BuildContext context) {
    return Card(
//      borderRadius: BorderRadius.circular(30),
      child: ListTile(
//        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//        color: Colors.green,
        title: TextInsideTaskCard(
          title,
          color: task.done ? Colors.green : Colors.blue,size: TaskTitleSize,
        ),
        //Text(title,style: TextStyle(color: task.done?Colors.green:Colors.blue),),
        subtitle: TextInsideTaskCard("$client\n$description", color: Colors.grey,),
      ),
    );
  }
}
