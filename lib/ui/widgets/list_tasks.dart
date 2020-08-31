import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/task.dart';

import 'task_tile.dart';
import 'text_widgets.dart';



class ListTasks extends StatefulWidget {
  final List<Task> tasks;
  final bool showUserName;


  const ListTasks(this.tasks, {Key key, this.showUserName}) : super(key: key);

  static List<Widget> tasksListsTiles(List<Task> tasks, {bool showUserName, bool doneTasksOnly}){
    List<Widget> tiles = List<Widget>();
    for(Task task in tasks){
      if(doneTasksOnly==null || task.done == doneTasksOnly)
        tiles.add(TaskTile.withTask(task, showUserName: showUserName??false));
    }
    return tiles;
  }

  static List<Widget> tasksListView(List<Task> tasks, {bool showUserName}){
    List<Widget> remainingList = List<Widget>();
    List<Widget> doneList = List<Widget>();
    for(Task task in tasks){
      if(task.done)
        doneList.add(TaskTile.withTask(task, showUserName: showUserName??false));
      else
        remainingList.add(TaskTile.withTask(task, showUserName: showUserName??false));
    }
    if(remainingList.isNotEmpty) remainingList.insert(0, SubSectionTitle("ONGOING TASKS", Colors.lightBlue));
    if(doneList.isNotEmpty) doneList.insert(0, SubSectionTitle("DONE TASKS", Colors.green));
    return remainingList + doneList;
  }


  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          if(widget.tasks[index] is Task)
            return TaskTile.withTask(widget.tasks[index], showUserName: widget.showUserName);
          return CircularProgressIndicator();
        });
  }


}
