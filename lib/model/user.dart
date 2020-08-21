import 'task.dart';

class User {
  final String name;
  final String subtitle;
  final User leader;
  List<User> members;
  final String uid;
  List<Task> tasks;


  User({this.name, this.subtitle, this.leader, this.uid});

  addTask(Task newTask){
    if(tasks == null)
      tasks = List<Task>();
    tasks.add(newTask);
    newTask.user = this;
  }

  addMember(User newMember){
    if(members == null)
      members = List<User>();
    members.add(newMember);
  }

  String toString() {
    // TODO: implement toString
    return name;
  }
}
