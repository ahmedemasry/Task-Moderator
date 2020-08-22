import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/bloc/counter_bloc.dart';
import 'package:task_master/bloc/counter_event.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/utils/constants.dart';
import 'package:task_master/ui/widgets/assigned_tasks_list.dart';

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
                    children: screenContent(),
                  )
                : Column(
                    children: screenContent(),
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

  List<Widget> screenContent() {
    return [
      Expanded(
        flex: 2,
        child: AssignedTasksList(
          list: Controller.getUsers(),
        ),
      ),
      Expanded(
        flex: 2,
        child: AssignedTasksList(
          list: Controller.getClients(),
        ),
      ),
      Expanded(
        flex: 3,
        child: AssignedTasksList(
          list: Controller.getTasks(),
        ),
      ),
    ];
  }
}
