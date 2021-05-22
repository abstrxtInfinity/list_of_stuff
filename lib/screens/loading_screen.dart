import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:list_of_stuff/screens/home.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: FutureBuilder(
          future: Hive.openBox('tasks',compactionStrategy: (int total, int deleted){
            return deleted>15;
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else
                return Home();
            } else
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xff195fbc),
                  color: Color(0xff58D4F1),
                ),
              );
          },
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.box('tasks').compact();
    Hive.box('tasks').close();
    super.dispose();
  }
}
