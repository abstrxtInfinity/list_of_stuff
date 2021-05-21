import 'package:flutter/material.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';
import 'package:list_of_stuff/screens/loading_screen.dart';
import 'package:list_of_stuff/widgets/introCard.dart';

class OnboardingScreen extends StatelessWidget {
  List<Widget> screens = [
    IntroCard(
      color: Colors.purple[600],
      heading: "Hi! 👋🏻",
      info: "Welcome to Todoi",
      index: 0,
    ),
    IntroCard(
      color: Color(0xffD86547),
      heading: "Create Your Task List",
      info: " Click on Add Task to create one ",
      index: 1,
      imageUrl: 'assets/images/createList.png',
      gifUrl: 'assets/images/create.png',
    ),
    IntroCard(
      color: Color(0xff195FBC),
      heading: "Strike Off Completed Tasks",
      info: "You need the dopamine of completing the task",
      index: 2,
      imageUrl: 'assets/images/checkbox.png',
      gifUrl: 'assets/images/doneTask.gif',
    ),
    IntroCard(
      color: Color(0xffBB4B77),
      heading: "Delete Tasks",
      info: "Swipe to Delete the Task",
      index: 3,
      imageUrl: 'assets/images/deleteTask.png',
      gifUrl: 'assets/images/delete.gif',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        onIndexUpdate: (index) {
          if (index == screens.length)
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Loader(),
              ),
            );
        },
        children: screens,
      ),
    );
  }
}
