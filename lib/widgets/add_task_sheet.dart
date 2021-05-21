import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import 'package:list_of_stuff/widgets/fab.dart';
import 'package:list_of_stuff/providers/task_provider.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  _AddTaskSheetState createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  TextEditingController _textController = TextEditingController();
  String priority;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: Container(
        margin: EdgeInsets.fromLTRB(1, 0, 1, 2),
        decoration: BoxDecoration(
            color: Color(0xff2F58E2),
            boxShadow: [
              BoxShadow(
                color: Color(0xff2F58E2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0,0),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Stack(
          children: [
            Positioned(
              top: -30,
              left: -30,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white10,
                    width: 10,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              right: -50,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white10,
                    width: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: -30,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black12,
                    width: 15,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Container(
                // padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                // margin: EdgeInsets.only(top: 60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.white54,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                            labelText: 'Task',
                            suffixIcon: Icon(
                              Icons.notes_rounded,
                              color: Colors.white54,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            isDense: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 30, 10, 10)),
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),

                        // onSubmitted: (_){
                        //   _textController.text.isEmpty
                        //       ? Navigator.pop(context)
                        //       : Provider.of<TaskProvider>(context,
                        //       listen: false)
                        //       .addTask(_textController.text);
                        //
                        // },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomRadioButton(
                        unSelectedColor: Colors.transparent,
                        selectedColor: Colors.white,
                        buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.black,
                          unSelectedColor: Colors.white,
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        customShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enableShape: true,
                        wrapAlignment: WrapAlignment.center,
                        enableButtonWrap: true,
                        spacing: 5,
                        elevation: 0,
                        absoluteZeroSpacing: false,
                        defaultSelected: 'MEDIUM',
                        buttonLables: [
                          "HIGH",
                          "MEDIUM",
                          "LOW",
                        ],
                        buttonValues: [
                          "HIGH",
                          "MEDIUM",
                          "LOW",
                        ],
                        radioButtonValue: (val) {
                          priority = val;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Fab(
                        textColor: Color(0xff2F58E2),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          if (_textController.text.isEmpty) {
                            Navigator.pop(context);
                          } else {
                            Provider.of<TaskProvider>(context, listen: false)
                                .addTask(_textController.text, priority);
                            Navigator.pop(context);
                          }
                        },
                        offset: Offset(0, 1),
                      ),
                      // OutlinedButton.icon(
                      //   onPressed: () {
                      //     if (_textController.text.isEmpty) {
                      //       Navigator.pop(context);
                      //     } else {
                      //       Provider.of<TaskProvider>(context, listen: false)
                      //           .addTask(_textController.text,priority);
                      //       Navigator.pop(context);
                      //     }
                      //   },
                      //   icon: Icon(Icons.save_rounded),
                      //   label: Text(
                      //     'Create',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      //   style: OutlinedButton.styleFrom(
                      //     primary: Colors.white,
                      //     backgroundColor: Colors.black26,
                      //     alignment: Alignment.center,
                      //     padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      //     shadowColor: Colors.transparent,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(5)),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
