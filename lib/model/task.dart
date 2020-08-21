
import 'package:task_master/model/user.dart';

import 'client.dart';

class Task {
  final String title;
  DateTime deadline;
  final Client client;
  String description;
  bool done = false;
  User user;

  Task({this.title, this.client});

  String toString() {
    // TODO: implement toString
    return title;
  }
}
