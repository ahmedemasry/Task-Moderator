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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
//      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
      bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.blueGrey,
          labelPadding: EdgeInsets.all(8),
          tabs: <Widget>[
        Icon(Icons.home),
        Icon(Icons.description),
      ]),
        body:TabBarView(
          children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Theme.of(context).accentColor,
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
          ),

            Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView(
                    children: <Widget>[
                      SectionTitle("TASKS", Colors.blue, icon: Icons.description,)
                      ]+ListTasks.tasksListView(Controller.getTasks())
                  )
                ),
              ],
            ),
        ],),


//      Column(
//        children: <Widget>[
//          Expanded(
//            flex: 1,
//            child: Container(
//              color: Theme.of(context).accentColor,
//            ),
//          ),
//          Expanded(
//            flex: 5,
//            child: MediaQuery.of(context).orientation == Orientation.landscape
//                ? Row(
//                    children: screenContent(false),
//                  )
//                : ListView(
//                    children: screenContent(true),
//                  ),
//          ),
//        ],
//      ),


      ),
    );
  }

  List<Widget> screenContent(bool isPortrait) {
    List<Widget> tasksList = ListTasks.tasksListView(Controller.getTasks());
    if(isPortrait){
      tasksList.insert(0, SectionTitle("USERS", Colors.blue, icon: Icons.supervised_user_circle,));
      tasksList.insert(1, Padding(padding: EdgeInsets.all(10),child: ListCards(list: Controller.getUsers(),)));
      tasksList.insert(2, SectionTitle("CLIENTS", Colors.blue, icon: Icons.assignment_ind,));
      tasksList.insert(3, Padding(padding: EdgeInsets.all(10), child: ListCards(list: Controller.getClients(),),
      ));
      tasksList.insert(4, SectionTitle("TASKS", Colors.blue,icon: Icons.description,));
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
