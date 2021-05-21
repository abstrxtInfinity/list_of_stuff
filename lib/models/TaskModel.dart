
import 'package:flutter/foundation.dart';

class TaskModel {
  String title;
  String id;
  String priority;
  bool isDone;


  TaskModel({@required this.title, this.id,this.isDone=false, this.priority="LOW"});

  void toggleDone(){
    isDone = !isDone;
  }

}