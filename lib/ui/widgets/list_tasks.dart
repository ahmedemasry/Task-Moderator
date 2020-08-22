import 'package:flutter/material.dart';
import 'package:task_master/model/task.dart';

import 'task_tile.dart';



class ListTasks extends StatefulWidget {
  final List<Task> tasks;
  final bool showUserName;

  const ListTasks(this.tasks, {Key key, this.showUserName}) : super(key: key);

  static List<Widget> tasksListsTiles(List<Task> tasks, {bool showUserName}){
    List<Widget> tiles = List<Widget>();
    for(Task task in tasks){
      tiles.add(TaskTile.withTask(task, showUserName: showUserName??false));
    }
    return tiles;
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
