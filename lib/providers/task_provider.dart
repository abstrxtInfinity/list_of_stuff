import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:list_of_stuff/models/TaskModel.dart';

class TaskProvider with ChangeNotifier {
  final taskBox = Hive.box('tasks');

  List<TaskModel> _tasks = [

  ];

  List<TaskModel> get tasks {
    return _tasks;
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String title, String priority) {
    TaskModel _t = TaskModel(
        title: title, id: DateTime.now().toString(), priority: priority);
    taskBox.add(_t);
    _tasks.add(_t);
    notifyListeners();
  }

  getData() {
    _tasks.clear();
    for (int i = 0; i < taskBox.length; i++) {
      _tasks.add(taskBox.getAt(i));
    }
    return tasks;
  }

  void updateTask(TaskModel task, int index) {
    task.toggleDone();
    taskBox.putAt(index, task);
    notifyListeners();
  }

  void deleteTask(int index, String id) async {
    TaskModel _t = _tasks.firstWhere((element) => (element.id == id));
    _tasks.removeWhere((element) => (element.id == id));
    Hive.box('tasks').deleteAt(index).catchError((err) => addTask(
          _t.title,
          _t.priority,
        ));
    notifyListeners();
  }
}
