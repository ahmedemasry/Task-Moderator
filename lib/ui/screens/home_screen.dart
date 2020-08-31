import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/ui/widgets/list_cards.dart';
import 'package:task_master/ui/widgets/list_tasks.dart';
import 'package:task_master/ui/widgets/task_card.dart';
import 'package:task_master/ui/widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller.setSomeInformation();

    return Scaffold(
//      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Theme.of(context).accentColor,
//              decoration: BoxDecoration(
//                  color: Theme.of(context).accentColor,
//                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.height/10))),
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
//                        <Widget>[
//                      ListCards(list: Controller.getUsers(),),
//                      ListCards(list: Controller.getClients(),),
//
//
//                    ],
                  ),
          ),
          Row(
            children: <Widget>[
              Tab(
                icon: Icon(Icons.account_box),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> screenContent(bool isPortrait) {
    List<Widget> tasksList = ListTasks.tasksListView(Controller.getTasks());
    if(isPortrait){
      tasksList.insert(0, SectionTitle("USERS", Colors.blue));
      tasksList.insert(1, ListCards(list: Controller.getUsers(),));
      tasksList.insert(2, SectionTitle("CLIENTS", Colors.blue));
      tasksList.insert(3, ListCards(list: Controller.getClients(),));
      tasksList.insert(4, SectionTitle("TASKS", Colors.blue));
    }

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
    return isPortrait? tasksList: expandedWidgets;
  }

}
