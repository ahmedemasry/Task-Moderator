import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';
import 'package:task_master/utils/constants.dart';

import 'task_card.dart';
import 'text_widgets.dart';

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
            description: task.description ?? "Lorem Ipsum is simply dummy text of the printing text.",
            client: task.client.title,
            task: task,
            showUserName: showUserName ?? false);

  Widget build(BuildContext context) {
    return ListTile(
//        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//        color: Colors.green,
      title: TextInsideTaskCard(
        title,
        color: task.done ? Colors.green : getDeadlineColor(task.deadline) ,size: TaskTitleSize,
      ),
      //Text(title,style: TextStyle(color: task.done?Colors.green:Colors.blue),),
      leading: IconButton(padding: EdgeInsets.all(0),iconSize: iconsSize,icon: Icon(task.done?Icons.check_circle:Icons.radio_button_unchecked), color: (task.done)?Colors.green:Colors.blueGrey, onPressed: () {  },),
      trailing: TextInsideTaskCard("$client", color: Colors.blueGrey,),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextInsideTaskCard("${showUserName?"${task.user.name} | ":""}${dateFormat(task.deadline)}", color: Color(0xFF364E68),height: 1.5,),
          SizedBox(height: 5,),
          TextInsideTaskCard("${description.length<50?description:"${description.substring(0,45)}..."}", color: Colors.blueGrey,),
          Divider(),
        ],
      ),
    );
  }
  String dateFormat(DateTime deadline){
    DateTime now = DateTime.now();
    if(deadline == null)
      return "no deadline";
    int years = deadline.year - now.year;
    int months = deadline.month - now.month;
    int days = deadline.day - now.day;
    int hours = deadline.hour - now.hour;
    int minutes = deadline.minute - now.minute;
    bool pm = (deadline.hour>12);

    if (minutes < 0) {
      minutes += 60;
      hours -= 1;
    }
    if (hours < 0) {
      hours += 24;
      days -= 1;
    }
    if (days < 0) {
      days += monthDays(now.month, now.year);
      months -= 1;
    }
    if(months < 0) {
      months += 12;
      years -= 1;
    }
    String hourMinForm = "${pm?deadline.hour-12:deadline.hour}:${deadline.minute} ${pm?"PM":"AM"}";


    //If in same month
    if(years == 0 && months == 0){
      //If Same Day
      if(days == 0) {
        if (hours >= 0) {
          return hours>=1?"remaining $hours hrs":"remaining $minutes mins";
        }
      }
      //If Day After
      if(days>0 && days <= 5){
        if(days == 1){
          return "Tomorrow, $hourMinForm";
        }
        return "remaining $days days";
      }
    }
    String y = (years>0) ? "/${deadline.year.toString()}" : "";
    String d = deadline.day.toString();
    String m = deadline.month.toString();
    String h = "${deadline.hour}:${deadline.minute}";
    if(now.isAfter(deadline) && !task.done)
      return "$d/$m$y, $hourMinForm PASSED !";
    return "$d/$m$y, $hourMinForm";
  }

  Color getDeadlineColor(DateTime deadline) {
    DateTime now = DateTime.now();

    if(deadline == null) return Colors.blue;
    if(deadline.isBefore(now)) return Colors.pink;

    int years = deadline.year - now.year;
    int months = deadline.month - now.month;
    int days = deadline.day - now.day;
    int hours = deadline.hour - now.hour;
    int minutes = deadline.minute - now.minute;
    bool pm = (deadline.hour>12);

    if (minutes < 0) {
      minutes += 60;
      hours -= 1;
    }
    if (hours < 0) {
      hours += 24;
      days -= 1;
    }
    if (days < 0) {
      days += monthDays(now.month, now.year);
      months -= 1;
    }
    if(months < 0) {
      months += 12;
      years -= 1;
    }


    if(years == 0 && months == 0){
      if(days == 0) {
        if(hours <= 1){
          return Colors.deepOrange;
        }
        else if (hours <= 4){
          return Colors.orangeAccent;
        }
      }
    }
      return Colors.blue;
  }

  num monthDays(int month, int year) {
    if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
      return 31;
    else if(month == 2)
      return year%4==0 ? 29 : 28;
    else
      return 30;
  }
}
