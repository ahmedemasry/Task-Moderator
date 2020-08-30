
import 'package:task_master/model/user.dart';

import 'client.dart';

class Task implements Comparable<Task>{
  final String _title;
  DateTime _deadline;
  final Client _client;
  String _description;
  bool _done = false;
  User _user;

  Task({title, client, deadline}) : _title = title, _client = client, _deadline = deadline;

  String toString() {
    // TODO: implement toString
    return _title;
  }
  String get title => _title;
  DateTime get deadline => _deadline;
  set deadline(DateTime value) {
    _deadline = value;
  }
  Client get client => _client;
  String get description => _description;
  set description(String value) {
    _description = value;
  }
  bool get done => _done;
  set done(bool value) {
    _done = value;
  }
  User get user => _user;
  set user(User value) {
    _user = value;
  }

  @override
  int compareTo(Task other) {
    // TODO: implement compareTo
    if(this.deadline == null) return 1;
    if(other.deadline == null) return -1;
    if(this.deadline.isAfter(other.deadline)) return 1;
    if(this.deadline.isBefore(other.deadline)) return -1;
    return 0;
  }


}
