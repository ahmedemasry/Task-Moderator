import 'package:task_master/controller/controller.dart';

import 'task.dart';

class User {
  final String _name;
  String _subtitle;
  final User _leader;
  List<User> _members;
  final String _uid;
  List<Task> _tasks;


  User({name, subtitle, leader, uid}) : this._name = name, this._subtitle = subtitle, this._leader = leader, this._uid = uid;



  addTask(Task newTask){
    tasks.add(newTask);
    newTask.user = this;
  }

  addMember(User newMember){
    if(_members == null)
      _members = List<User>();
    _members.add(newMember);
  }

  int tasksCount(){
    return Controller.tasksCount(tasks);
  }
  int remainingTasksCount(){
    return Controller.remainingTasksCount(tasks);
  }
  int doneTasksCount(){
    return Controller.doneTasksCount(tasks);
  }

  String toString() {
    return _name;
  }

  List<User> get members => _members;
  String get uid => _uid;
  List<Task> get tasks {
    if(_tasks == null)
      _tasks = List<Task>();
    return _tasks;
  }
  get name => _name;
  get subtitle => _subtitle;
  User get leader => _leader;
  set subtitle(String value) {
    _subtitle = value;
  }
}
