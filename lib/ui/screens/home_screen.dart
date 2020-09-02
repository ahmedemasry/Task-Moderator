import 'package:flutter/material.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/ui/tabs/clients_tab.dart';
import 'package:task_master/ui/tabs/home_tab.dart';
import 'package:task_master/ui/tabs/members_tab.dart';
import 'package:task_master/ui/tabs/tasks_tab.dart';
import 'package:task_master/ui/widgets/list_tasks.dart';
import 'package:task_master/ui/widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller.setSomeInformation();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
//      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
//      : Text("aaaa"),
//      drawer: Center(child: Text("AAA"),),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.blueGrey,
              labelPadding: EdgeInsets.all(8),
              tabs: <Widget>[
                Icon(Icons.home),
                Icon(Icons.description),
                Icon(Icons.assignment_ind),
                Icon(Icons.supervised_user_circle),
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeTab(),
            TasksTab(),
            ClientsTab(),
            MembersTab(),
          ],
        ),
      ),
    );
  }


}