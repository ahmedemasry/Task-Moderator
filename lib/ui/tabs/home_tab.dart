
import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/ui/widgets/list_cards.dart';
import 'package:task_master/ui/widgets/list_tasks.dart';
import 'package:task_master/ui/widgets/text_widgets.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Theme.of(context).accentColor,
            child: Center(child: TextInsideTaskCard("HOME", size: 25,height: 4,textAlign: TextAlign.left,)),
          ),
        ),
        Expanded(
          flex: 5,
          child: MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
            children: screenContent(false),
          )
              : ListView(
            children: screenContent(true),
          ),
        ),
      ],
    );
  }

  List<Widget> screenContent(bool isPortrait) {
    List<Widget> tasksList = ListTasks.tasksListView(Controller.getTasks());
    if(isPortrait){
      tasksList.insert(0, SectionTitle("MEMBERS", Colors.blue, icon: Icons.supervised_user_circle,));
      tasksList.insert(1, Padding(padding: EdgeInsets.all(10),child: ListCards(list: Controller.getUsers(),)));
      tasksList.insert(2, SectionTitle("CLIENTS", Colors.blue, icon: Icons.assignment_ind,));
      tasksList.insert(3, Padding(padding: EdgeInsets.all(10), child: ListCards(list: Controller.getClients(),),
      ));
      tasksList.insert(4, SectionTitle("TASKS", Colors.blue,icon: Icons.description,));
    }

    if(isPortrait) return tasksList;

    List<Widget> expandedWidgets=[
      Expanded(
        flex: 2,
        child: ListCards(
          list: Controller.getUsers(),
        ),
      ),
      Expanded(
        flex: 2,
        child: ListCards(
          list: Controller.getClients(),
        ),
      ),
      Expanded(
        flex: 3,
        child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) => tasksList[index],
        ),
      ),
    ];
    return expandedWidgets;
  }

}
