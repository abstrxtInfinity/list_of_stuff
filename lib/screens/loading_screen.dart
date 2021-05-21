import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xff195fbc),
          color: Color( 0xff58D4F1),
        ),
      ),
    );
  }
}

