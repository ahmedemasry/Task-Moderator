
import 'package:task_master/controller/controller.dart';

class Client {
  final String title;
  final Package package;
  String description;

  Client({this.title, this.package});
  @override
  String toString() {
    // TODO: implement toString
    return title;
  }
  String packageString(){
    if(this.package == Package.fourK) return "4k package";
    if(this.package == Package.sixK) return "6k package";
    if(this.package == Package.eightK) return "8k package";
    if(this.package == Package.tenK) return "10k package";
    if(this.package == Package.special) return "special package";
  }

  int tasksCount(){
    return Controller.getClientTasks(this).length;
  }
}

enum Package{
  fourK, sixK, eightK, tenK, special
}