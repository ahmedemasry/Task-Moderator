import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';

class Controller{
  static List<Client> _clients = [];
  static List<User> _users = [];

  Controller(){
//    setSomeInformation();
  }

  static void setSomeInformation(){
    Client fabulous = Client(title: 'Fabulous', package: Package.eightK);
    Client ahmedFarouk = Client(title: 'Ahmed Farouk', package: Package.sixK);
    Client genZ = Client(title: 'Gen-Z', package: Package.special);
    User yousef = User(name: "Youssef Khalifa", leader: null, uid: '0', subtitle: "Social Media Leader");
    User ahmed = User(name: "Ahmed ElMasry", leader: yousef, uid: '1', subtitle: "Animator");
    User moustafa = User(name: "Moustafa Farid", leader: yousef, uid: '2', subtitle: "Graphic Designer");
    yousef.addMember(ahmed);
    yousef.addMember(moustafa);

    yousef.addTask(title: "Fabulous Client", client: fabulous,deadline: DateTime.now().subtract(Duration(minutes: 5)));
    yousef.addTask(title: "AhmedFarouk Client", client: ahmedFarouk,deadline: DateTime.now().subtract(Duration(minutes: 5)));
    yousef.addTask(title: "AhmedFarouk Client", client: ahmedFarouk,deadline: DateTime.now().add(Duration(minutes: 54)));
    yousef.addTask(title: "Meeting with graphics team", client: genZ, deadline: DateTime.now().add(Duration(days: 1)));
    yousef.tasks[1].done = true;

    ahmed.addTask(title: "Fabulous Video", client: fabulous, deadline: DateTime.now().add(Duration(hours: 3, minutes: 23)));
    ahmed.addTask(title: "Ahmed Farouk Services Viedo", client: ahmedFarouk, deadline: DateTime.now().add(Duration(hours: 4, minutes:46)));
    ahmed.addTask(title: "Gen-Z Production Services", client: genZ, deadline: DateTime.now().add(Duration(hours: 8, minutes:55)));
    ahmed.addTask(title: "Gen-Z Software Services", client: genZ, deadline: DateTime.now().add(Duration(hours: 3, minutes:4)));
    ahmed.tasks[0].done = true;
    ahmed.tasks[1].done = true;
    ahmed.tasks[2].done = true;
//    moustafa.addTask(Task(title: "fabulous Post 1", client: fabulous));
//    moustafa.addTask(Task(title: "fabulous Post 2", client: fabulous));
//    moustafa.addTask(Task(title: "Gen-Z Grid 1", client: genZ));
//    moustafa.addTask(Task(title: "ahmedFarouk Post 1", client: ahmedFarouk, deadline: DateTime.now().add(Duration(hours: 0, minutes:18))));
    moustafa.addTask(title: "ahmedFarouk Post 2", client: ahmedFarouk);
    moustafa.addTask(title: "fabulous Post 3", client: fabulous, deadline: DateTime.now().add(Duration(days: 1, minutes:46)));
    moustafa.addTask(title: "Gen-Z Grid 2", client: genZ, deadline: DateTime.now().add(Duration(days: 3, hours:2)));
    moustafa.tasks[0].done = true;
    moustafa.tasks[1].done = true;
    moustafa.tasks[2].done = true;
//    moustafa.tasks[3].done = true;

    print("TASKS:  ${getClientTasks(fabulous)}");

    getUsers().add(yousef);
    getUsers().add(ahmed);
    getUsers().add(moustafa);



    _clients = [fabulous, genZ, ahmedFarouk];
  }

  static List<Task> getTasks(){
    List<Task> _tasks = [];
    for(User user in getUsers()){
      for(Task task in user.tasks){
        _tasks.add(task);
      }
    }
    _tasks.sort();
    return _tasks;
  }
  static Map<User, List<Task>> getUserTasksMap(){
    Map<User, List<Task>> map = Map<User, List<Task>>();
    for(User user in getUsers()){
      List<Task> _tasks = [];
      for(Task task in user.tasks){
        _tasks.add(task);
      }
      map.putIfAbsent(user, () => _tasks);
    }
    return map;
  }
  static List<Task> getClientTasks(Client client){
    List<Task> _tasks = [];
    for(User user in getUsers()){
      for(Task task in user.tasks){
        if(task.client == client){
        _tasks.add(task);
        }
      }
    }
    return _tasks;
  }
  static Map<User, List<Task>> getClientUserTasksMap(Client client){
    Map<User, List<Task>> map = Map<User, List<Task>>();
    for(User user in getUsers()){
      List<Task> _tasks = [];
      for(Task task in user.tasks){
        if(task.client == client){
          _tasks.add(task);
        }
      }
      map.putIfAbsent(user, () => _tasks);
    }
    return map;
  }
  static User? getUserWithUID(String uid){
    List<User> users = getUsers();
    for(User user in  users){
      if(user.uid == uid){
        return user;
      }
    }
    return null;
  }
  static Client? getClientWithTitle(String title){
    List<Client> clients = getClients();
    for(Client client in  clients){
      if(client.title == title){
        return client;
      }
    }
    return null;
  }
  static List<User> getUsers() {
    //TODO
    //Get Users from firebase
    return _users;
  }
  static List<Client> getClients() {
    //TODO
    //Get Clients from firebase
    return _clients;
  }
  static addUser(User user){
    //TODO
    //Add User to firebase
    _users.add(user);
  }
  static addClient(Client client){
    //TODO
    //Add Client to firebase
    _clients.add(client);
  }

  static int tasksCount(Object? object){
    if(object is User)
      return object.tasks.length;
    if(object is Client)
      return getClientTasks(object).length;
    else if (object is List<Task>)
      return object.length;
    return 0;
  }
  static int doneTasksCount(Object? object){
    int count = 0;
    List<Task> tasks;
    if(object is User)
      tasks =  object.tasks;
    else if(object is Client)
      tasks = getClientTasks(object);
    else if(object is List<Task>)
      tasks = object;
    else
      return 0;
    for(Task task in tasks)
    {
      if(task.done == true)
      {
        count++;
      }
    }
    return count;
  }
  static int remainingTasksCount(Object? object){
    if((object is User) || (object is Client) || (object is List<Task>))
      return tasksCount(object) - doneTasksCount(object);
    return 0;
  }


}