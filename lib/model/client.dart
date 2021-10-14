
import 'package:task_master/controller/controller.dart';
import 'package:task_master/model/task.dart';

import 'user.dart';

class Client {
  String? _title;
  Package? _package;
  String? _description;



  Client({title, package, description}) : _title = title, _package = package, _description = description;
  @override
  String toString() {
    // TODO: implement toString
    return _title!;
  }
  String packageString(){
    if(this._package == Package.fourK) return "4k package";
    if(this._package == Package.sixK) return "6k package";
    if(this._package == Package.eightK) return "8k package";
    if(this._package == Package.tenK) return "10k package";
    if(this._package == Package.special) return "special package";
    else return "";
  }
  List<Task> getTasks(){
    return Controller.getClientTasks(this);
  }
  List<Task>? getTasksOfUser(User user){
    Map<User, List<Task>> map = Controller.getClientUserTasksMap(this);
    return map[user];
  }

  int tasksCount({User? user}){
    if(user != null)
      return Controller.tasksCount(getTasksOfUser(user));
    return Controller.tasksCount(getTasks());
  }
  int remainingTasksCount({User? user}){
    if(user != null)
      return Controller.remainingTasksCount(getTasksOfUser(user));
    return Controller.remainingTasksCount(getTasks());
  }
  int doneTasksCount({User? user}){
    if(user != null)
      return Controller.doneTasksCount(getTasksOfUser(user));
    return Controller.doneTasksCount(getTasks());
  }

  String? get title => _title;
  set title(String? value) {
    _title = value;
  }
  Package? get package => _package;
  set package(Package? value) {
    _package = value;
  }
  String? get description => _description;
  set description(String? value) {
    _description = value;
  }

}

enum Package{
  fourK, sixK, eightK, tenK, special
}