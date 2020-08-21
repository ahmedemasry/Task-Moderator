import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';
import 'package:task_master/ui/widgets/task_tile.dart';

import 'task_card.dart';

class AssignedTasksList extends StatefulWidget {
  @override
  _AssignedTasksListState createState() => _AssignedTasksListState();
}

class _AssignedTasksListState extends State<AssignedTasksList> {

  @override
  Widget build(BuildContext context) {
    Controller.setSomeInformation();

    List<Client> client = Controller.getClients();
    List<User> user = Controller.getUsers();
    List<dynamic> tasks = Controller.getTasks();
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ListView.builder(
              scrollDirection: MediaQuery.of(context).orientation==Orientation.portrait?Axis.horizontal:Axis.vertical,
              itemCount: user.length,
              itemBuilder: (context, index) {
                return TaskCard.withUser(user[index]);
              }
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            scrollDirection: MediaQuery.of(context).orientation==Orientation.portrait?Axis.horizontal:Axis.vertical,
            itemCount: client.length,
            itemBuilder: (context, index) {
              return TaskCard.withClient(client[index]);
            },
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView.builder(
//            scrollDirection: Axis.horizontal,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskTile.withTask(tasks[index] ,showUserName: true);
            },
          ),
        ),
      ],
    );
  }
}
