import 'package:task_master/model/client.dart';
import 'package:task_master/model/task.dart';
import 'package:task_master/model/user.dart';

class Controller{
  static List<Client> _clients = new List<Client>();
  static List<User> _users = new List<User>();
//  static Controller controllerSimulator;

  Controller(){
//    if(controllerSimulator == null) {
//      controllerSimulator = Controller();
      setSomeInformation();
//    }
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

    yousef.addTask(Task(title: "Fabulous Client", client: fabulous));
    yousef.tasks[0].done = true;
    yousef.addTask(Task(title: "Meeting with graphics team", client: genZ));

    ahmed.addTask(Task(title: "Fabulous Video", client: fabulous));
    ahmed.addTask(Task(title: "Ahmed Farouk Services Viedo", client: ahmedFarouk));
    ahmed.tasks[0].done = true;
    ahmed.tasks[1].done = true;
    ahmed.addTask(Task(title: "Gen-Z Production Services", client: genZ));
    ahmed.addTask(Task(title: "Gen-Z Software Services", client: genZ));

    moustafa.addTask(Task(title: "fabulous Post 1", client: fabulous));
    moustafa.addTask(Task(title: "fabulous Post 2", client: fabulous));
    moustafa.addTask(Task(title: "Gen-Z Grid 1", client: genZ));
    moustafa.addTask(Task(title: "ahmedFarouk Post 1", client: ahmedFarouk));
    moustafa.tasks[0].done = true;
    moustafa.tasks[1].done = true;
    moustafa.tasks[2].done = true;
    moustafa.tasks[3].done = true;
    moustafa.addTask(Task(title: "ahmedFarouk Post 2", client: ahmedFarouk));
    moustafa.addTask(Task(title: "fabulous Post 3", client: fabulous));
    moustafa.addTask(Task(title: "Gen-Z Grid 2", client: genZ));
    moustafa.addTask(Task(title: "Gen-Z Grid 3", client: genZ));
    moustafa.addTask(Task(title: "Gen-Z Grid 4", client: genZ));
    moustafa.addTask(Task(title: "Gen-Z Grid 5", client: genZ));





    _users= [yousef, ahmed, moustafa];

    _clients = [fabulous, genZ, ahmedFarouk];
  }

  static List<Task> getTasks(){
    List<Task> _tasks = List<Task>();
    for(User user in _users){
      for(Task task in user.tasks){
        _tasks.add(task);
      }
    }
    return _tasks;
  }
  static Map<User, List<Task>> getUserTasksMap(){
    Map<User, List<Task>> map = Map<User, List<Task>>();
    for(User user in _users){
      List<Task> _tasks = List<Task>();
      for(Task task in user.tasks){
        _tasks.add(task);
      }
      map.putIfAbsent(user, () => _tasks);
    }
    return map;
  }
  static List<Task> getClientTasks(Client client){
    List<Task> _tasks = List<Task>();
    for(User user in _users){
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
    for(User user in _users){
      List<Task> _tasks = List<Task>();
      for(Task task in user.tasks){
        if(task.client == client){
          _tasks.add(task);
        }
      }
      map.putIfAbsent(user, () => _tasks);
    }
    return map;
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
  static addTask({Task task, User user}){
    //TODO
    //Add Task to the User in firebase
    user.addTask(task);
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

  static int tasksCount(Object object){
    if(object is User)
      return object.tasks.length;
    if(object is Client)
      return getClientTasks(object).length;
    return null;
  }
  static int doneTasksCount(Object object){
    int count = 0;
    List<Task> tasks;
    if(object is User)
      tasks =  object.tasks;
    else if(object is Client)
      tasks = getClientTasks(object);
    else
      return null;
    for(Task task in tasks)
    {
      if(task.done == true)
      {
        count++;
      }
    }
    return count;
  }
  static int remainingTasksCount(Object object){
    if((object is User) || (object is Client))
      return tasksCount(object) - doneTasksCount(object);
    return null;
  }


}