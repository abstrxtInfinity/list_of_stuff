import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'TaskModel.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String id;
  @HiveField(2)
  String priority;
  @HiveField(3)
  bool isDone;


  TaskModel({@required this.title, this.id,this.isDone=false, this.priority});

  void toggleDone(){
    isDone = !isDone;
  }

}