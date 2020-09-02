import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/ui/widgets/list_cards.dart';
import 'package:task_master/ui/widgets/list_tasks.dart';
import 'package:task_master/ui/widgets/text_widgets.dart';

class MembersTab extends StatelessWidget {
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
              "MEMBERS",
              size: 25, height: 4, textAlign: TextAlign.left,)),
          ),
        ),
        Expanded(
            flex: 2,
            child: ListCards(list: Controller.getUsers(),),
        ),
        Expanded(
          flex: 3,
          child: ListView(
            children: ListTasks.tasksListView(Controller.getTasks(), showUserName: true),
            ),
        ),
      ],
    );
  }
}
