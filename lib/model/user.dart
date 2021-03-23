import 'package:task_master/controller/controller.dart';

import 'task.dart';

class User {
  final String _name;
  String _subtitle;
  final User _leader; ////
  List<User> _members; ////
  final String _uid;
  List<Task> _tasks;


  User({name, subtitle, leader, uid, tasks, }) : this._name = name, this._subtitle = subtitle, this._leader = leader, this._uid = uid, this._tasks=tasks;



  addTask(Task newTask){
    tasks.add(newTask);
    newTask.user = this;
  }

  addMember(User newMember){
    members.add(newMember);
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

  List<User> get members {
    if(_members == null)
      _members = List<User>();
    return _members;
  }
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


  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(
      name: json["name"],
      subtitle: json["subtitle"],
      leader: Controller.getUserWithUID(json["leader"]),
      uid: json["uid"],
      tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
    );
    for(Task task in user.tasks) {
      task.user = user;
    }
    if(user.leader != null)
      user.leader.addMember(user);
    return user;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "subtitle": subtitle,
    "leader": leader == null ? null : leader.uid,
    "uid": uid,
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
  };



}












//JSON File
/*
{
  "name": "Ahmed ElMasry",
  "subtitle": "3D Animator",
  "leader": "5prSd7gA6MapeNlIx35SqOEPgok2",
  "members": [
      "5prSd7gA6MapeNlIx35SqOEPgok2",
      "5prSd7gA6MapeNlIx35SqOEPgok2"
      ],
"uid": "5prSd7gA6MapeNlIx35SqOEPgok2",
  "tasks": [
    {"title": "task title",
    "deadline": "2012-04-23T18:25:43.511Z",
    "client": "5prSd7gA6MapeNlIx35SqOEPgok2",
    "description":"dfag asgf sadg asfdg awrytdb reask vlkh ig",
    "done" : false},
    {"title": "task title2",
    "deadline": "2019-04-23T18:25:43.511Z",
    "client": "5prSd7gA6MapeNlIx35SqOEPgok2",
    "description":null,
    "done" : true},
    {"title": "task 3",
    "deadline": null,
    "client": "5prSd7gA6MapeNlIx35SqOEPgok2",
    "description":null,
    "done" : true}
    ]
}
}*/