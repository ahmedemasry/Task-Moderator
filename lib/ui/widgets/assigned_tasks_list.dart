import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';
import 'package:task_master/ui/widgets/task_tile.dart';

import 'task_card.dart';

class AssignedTasksList extends StatefulWidget {
  final List<Object> list;

  const AssignedTasksList({Key key, @required this.list}) : super(key: key);
  @override
  _AssignedTasksListState createState() => _AssignedTasksListState();
}

class _AssignedTasksListState extends State<AssignedTasksList> {
  _AssignedTasksListState();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection:
            MediaQuery.of(context).orientation == Orientation.portrait && !(widget.list is List<Task>)
                ? Axis.horizontal
                : Axis.vertical,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          if(widget.list[index] is User)
            return TaskCard.withUser(widget.list[index]);
          if(widget.list[index] is Client)
            return TaskCard.withClient(widget.list[index]);
          if(widget.list[index] is Task)
            return TaskTile.withTask(widget.list[index]);
          return CircularProgressIndicator();
        });
  }
}
