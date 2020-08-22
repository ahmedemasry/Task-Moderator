import 'package:flutter/material.dart';
import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';
import 'package:task_master/ui/widgets/task_tile.dart';

import 'task_card.dart';

class ListCards extends StatefulWidget {
  final List<Object> list;

  const ListCards({Key key, @required this.list}) : super(key: key);
  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  _ListCardsState();

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height: isPortrait?140:1000,
      child: ListView.builder(
          scrollDirection:
                isPortrait
                  ? Axis.horizontal
                  : Axis.vertical,
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            if(widget.list[index] is User)
              return TaskCard.withUser(widget.list[index]);
            if(widget.list[index] is Client)
              return TaskCard.withClient(widget.list[index]);
            if(widget.list[index] is Task)
              return TaskCard.withTask(widget.list[index]);
            return CircularProgressIndicator();
          }),
    );
  }
}
