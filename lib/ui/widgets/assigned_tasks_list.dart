import 'package:flutter/material.dart';


class AssignedTasksList extends StatefulWidget {
  @override
  _AssignedTasksListState createState() => _AssignedTasksListState();
}

class _AssignedTasksListState extends State<AssignedTasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: ListTile(
            leading: Checkbox(value: true,),
            title: Text('Test Tile'),
            subtitle: Text('client: \ndetails should goes here, including deadline and other info.'),

          ),
        );
      },
    );
  }
}
