
import 'package:flutter/scheduler.dart';
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/user.dart';

import 'client.dart';

class Task implements Comparable<Task>{
  //Tasks are stored inside
  String _title;
  DateTime _deadline;
  Client _client;   ////



  String _description;
  bool _done = false;
  User _user;

  Task({title, client, deadline, done, description}) : _title = title, _client = client, _deadline = deadline, _done = done, _description = description;

  String toString() {
    // TODO: implement toString
    return _title;
  }
  String get title => _title;
  set title(String value){
    _title = value;
  }
  DateTime get deadline => _deadline;
  set deadline(DateTime value) {
    _deadline = value;
  }
  Client get client => _client;
  set client(Client value) {
    _client = value;
  }
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


  factory Task.fromJson(Map<String, dynamic> json) => Task(
      title: json["title"],
      deadline: json["deadline"] == null ? null : DateTime.parse(
          json["deadline"]),
      client: Controller.getClientWithTitle(json["client"]),
      description: json["description"] == null ? null : json["description"],
      done: json["done"],
    );

  Map<String, dynamic> toJson() => {
    "title": title,
    "deadline": deadline == null ? null : deadline.toIso8601String(),
    "client": client.title,
    "description": description == null ? null : description,
    "done": done,
  };


}







//JSON File
/*
{
  "name": "Ahmed ElMasry",
  "subtitle": "3D Animator",
  "leader": "5prSd7gA6MapeNlIx35SqOEPgok2",
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