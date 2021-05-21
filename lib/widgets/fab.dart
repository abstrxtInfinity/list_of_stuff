import 'package:flutter/material.dart';


class Fab extends StatelessWidget {
  Color textColor;
  Color backgroundColor;
  Function onPressed;
  Offset offset;
  Fab({this.backgroundColor,this.textColor,this.onPressed,this.offset});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: backgroundColor,
            blurRadius: 10,
            // spreadRadius: 2,
            offset: offset,
          ),
        ],
      ),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        icon: (Icon(
          Icons.add,
          color: textColor,
        )),
        label: Text(
          'Create Task',
          style: TextStyle(color: textColor,fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
