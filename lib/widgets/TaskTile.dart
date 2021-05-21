import 'dart:ui';

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String id;
  final bool isDone;
  final Function checkBox;
  final Function delete;
  final String priority;

  TaskTile(
      {this.isDone,
      this.id,
      this.checkBox,
      this.title,
      this.priority,
      this.delete});

  @override
  Widget build(BuildContext context) {
    void deleteTask() {
      delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          content: Text(
            'Task Dismissed',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
                height: 1,
            ),

            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          width: 150,
          padding: EdgeInsets.all(0),
        ),
      );
    }

    return Dismissible(
      key: Key(id),
      onDismissed: (direction) => deleteTask(),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ]),
        child: Row(
          children: [
            Checkbox(
              value: isDone,
              onChanged: checkBox,
              activeColor: Color(0xff1AFF00),
              splashRadius: 10,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 40,
              width: 2,
              decoration: BoxDecoration(
                  color:isDone? Color(0xff1AFF00): Color(0xffFF006F),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(color: isDone? Color(0xff1AFF00): Color(0xffFF006F), blurRadius: 5),
                  ]),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subhead.copyWith(
                      decoration: isDone? TextDecoration.lineThrough: TextDecoration.none,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    semanticsLabel: 'Your Task Title',

                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    priority,
                    style: Theme.of(context).textTheme.subtitle,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    semanticsLabel: 'Task Priority',
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteTask(),
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }
}
