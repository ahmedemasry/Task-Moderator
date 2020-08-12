import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_master/utils/constants.dart';
import 'package:task_master/ui/widgets/assigned_tasks_list.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.height/10))),
//              color: Theme.of(context).accentColor,
            ),
          ),
          Expanded(
            flex: 3,
            child:
            AssignedTasksList(),
          ),
          Row(

            children: <Widget>[
              Tab(icon: Icon(Icons.account_box),)
            ],
          ),
        ],
      ),
    );
  }
}
