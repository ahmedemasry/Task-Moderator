import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';
import 'package:task_master/utils/constants.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final remainingTasks;
  final doneTasks;
  final Object object;
  final bool showUserName;


  TaskCard({Key key,
    @required this.title,
    @required this.subtitle,
    this.remainingTasks = 0,
    this.doneTasks = 0,
    this.object,
    this.showUserName = false})
      : super(key: key);

  @override
  TaskCard.withTask(Task task, {showUserName}) :this(title: task.title,
      subtitle: task.client.title,
      object: task,
      showUserName: showUserName ?? false);


  TaskCard.withUser(User user)
      : this(
      title: user.name,
      subtitle: user.subtitle,
      remainingTasks: user.remainingTasksCount(),//Controller.remainingTasksCount(user),
      doneTasks: user.doneTasksCount(),//Controller.doneTasksCount(user),
      object: user);

  TaskCard.withClient(Client client)
      : this(
      title: client.title,
      subtitle: client.packageString(),
      remainingTasks: client.remainingTasksCount(),//Controller.remainingTasksCount(client),
      doneTasks: client.doneTasksCount(),//Controller.doneTasksCount(client),
      object: client);

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
//        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextInsideTaskCard(title, color: Colors.white, size: TaskTitleSize, height: 2, textAlign: TextAlign.center),
              TextInsideTaskCard(subtitle, color: Colors.white, textAlign: TextAlign.center,),
              infoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoSection() {
    if (remainingTasks == null ||
        doneTasks == null ||
        remainingTasks + doneTasks == 0) {
      if (object is Task) {
        Task task = object;
        return Column(
          children: <Widget>[
            showUserName ? TextInsideTaskCard(task.user.name, color: Colors.white, height:2) : Container(),
            IconButton(icon: Icon(task.done ? Icons.done : Icons.crop_3_2), iconSize: 40, disabledColor: Colors.white,)
          ],
        );
      }
    } else {
      return Column(
        children: <Widget>[
          TextInsideTaskCard(
              "${remainingTasks + doneTasks} total tasks", color: Colors.white,height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextInsideTaskCard(
                "$remainingTasks remaining    ",
                color: Colors.yellow,),
              TextInsideTaskCard("$doneTasks done", color: Colors.white),
            ],
          ),
        ],
      );
    }
  }

}









class TextInsideTaskCard extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double height;
  final TextAlign textAlign;

  TextInsideTaskCard(this.text,
      {this.color = Colors.white, this.size = TaskSubtitleSize,
        this.height = 1, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: size, height: height),
    );
  }
}

