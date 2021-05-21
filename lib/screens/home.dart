import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:list_of_stuff/providers/task_provider.dart';
import 'package:list_of_stuff/widgets/TaskTile.dart';
import 'package:list_of_stuff/widgets/add_task_sheet.dart';
import 'package:list_of_stuff/widgets/fab.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context, listen: true);
    final taskList = tasks.tasks;
    final size = MediaQuery.of(context).size;

    final now = DateTime.now();
    final date = DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,

                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(40),
                    //     bottomRight: Radius.circular(40)),
                    // boxShadow: [
                    //   BoxShadow(
                    //   ),
                    // ]
                  ),
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          Text(
                            'Today\'s Tasks',
                            style: Theme.of(context).textTheme.title,
                          )
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff58D4F1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff58D4F1), blurRadius: 10),
                            ]),
                        child: Text(
                          tasks.taskCount.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                taskList.isEmpty
                    ? Container(
                        height: size.height * 0.6,
                        child: Center(
                          child: Text('Your Tasks Will Be Displayed Here',style: Theme.of(context).textTheme.subhead,),
                        ),
                      )
                    : Container(
                        height: size.height * 0.7,
                        margin: EdgeInsets.only(bottom: size.height * 0.1),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return TaskTile(
                              title: taskList[index].title,
                              id: taskList[index].id,
                              isDone: taskList[index].isDone,
                              priority: taskList[index].priority,
                              checkBox: (bool checkBoxState) {
                                tasks.updateTask(taskList[index]);
                              },
                              delete: () =>
                                  tasks.deleteTask(taskList[index].id),
                            );
                          },
                          itemCount: taskList.length,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Fab(
        backgroundColor: Color(0xff2F58E2),
        textColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(

            context: context,
            builder: (_) => AddTaskSheet(),
            backgroundColor: Colors.transparent,
            isDismissible: true,
            isScrollControlled: false,
          );
        },offset: Offset(0, 4),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
