import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:list_of_stuff/models/TaskModel.dart';
import 'package:list_of_stuff/providers/task_provider.dart';
import 'package:list_of_stuff/screens/loading_screen.dart';
import 'package:list_of_stuff/screens/introPageScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> TaskProvider(),
      child: MaterialApp(
        title: 'Todoify',
        theme: ThemeData(
          primaryColor: Color(0xffF5F7FA),
          accentColor: Color(0xff887ED0),
          fontFamily: 'koho',
          textTheme: TextTheme(
            title: TextStyle(
                color: Color(0xff25242f),
                fontSize: 22,
                fontWeight: FontWeight.bold),
            subhead: TextStyle(
                color: Color(0xff000000),
                fontSize: 16,
                letterSpacing: 0.7,
                wordSpacing: 1,
                fontWeight: FontWeight.w500),
            subtitle: TextStyle(
                color: Color(0xff868686),
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>   {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), checkFirstSeen);
    super.initState();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen')??false);
    if(_seen){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Loader(),
        ),
      );
    }else{
       await prefs.setBool('seen', true);
       closeSplashScreen();

    }
  }

  void closeSplashScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff58D4F1),
      body: Center(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/foreground.png'),
            ),
          ),
        ),
      ),
    );
  }
}
