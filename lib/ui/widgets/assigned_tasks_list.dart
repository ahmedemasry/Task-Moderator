import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/task.dart';
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
    List<Task> fabulousTasks = Controller.getClientTasks(Controller.getClients()[0]);
    return ListView.builder(
      scrollDirection:Axis.horizontal,
      itemCount: fabulousTasks.length,
      itemBuilder: (context, index) {
        return TaskCard.withTask(fabulousTasks[index], showUserName: true,);

//        return Card(
//          elevation: 2,
//          child: ListTile(
//            leading: Checkbox(value: true,),
//            title: Text('Test Tile'),
//            subtitle: Text('client: \ndetails should goes here, including deadline and other info.'),
//          ),
//        );



      },
    );
  }
}
