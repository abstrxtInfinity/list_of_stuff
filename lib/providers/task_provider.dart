import 'package:flutter/foundation.dart';

import 'package:list_of_stuff/models/TaskModel.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _tasks = [
    TaskModel(title: 'Create New Task with the Button Below', id: DateTime.now().toString(), priority: 'HIGH'),
    TaskModel(title: 'Strike off the Task', id: DateTime.now().toString(), priority: 'LOW'),
    TaskModel(title: 'Swipe to delete or Tap the button', id: DateTime.now().toString(), priority: 'MEDIUM'),


  ];

  List<TaskModel> get tasks {
    return _tasks;
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String title, String priority) {
    TaskModel _t = TaskModel(title: title, id: DateTime.now().toString(),priority: priority);
    _tasks.add(_t);
    notifyListeners();
  }
  void updateTask(TaskModel task) {
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(String id) async {
    _tasks.removeWhere((element) => (element.id == id));
    notifyListeners();
  }
}
