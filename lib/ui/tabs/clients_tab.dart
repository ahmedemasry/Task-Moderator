import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/ui/widgets/list_cards.dart';
import 'package:task_master/ui/widgets/list_tasks.dart';
import 'package:task_master/ui/widgets/text_widgets.dart';

class ClientsTab extends StatelessWidget {
  Client selectedClient = Controller.getClients()[0];
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
              "CLIENTS : ${selectedClient.title}",
              size: 25, height: 4, textAlign: TextAlign.left,)),
          ),
        ),
        Expanded(
            flex: 2,
            child: ListCards(list:  Controller.getClients(),),
        ),
        Expanded(
          flex: 3,
          child: ListView(
            children: <Widget>[SectionTitle("${selectedClient.title} TASKS", Colors.blue,icon: Icons.description,),] + ListTasks.tasksListView(Controller.getClientTasks(selectedClient), showUserName: true),
          ),
        ),
      ],
    );
  }
}
