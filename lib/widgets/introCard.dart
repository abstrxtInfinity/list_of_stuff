import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_of_stuff/screens/home.dart';

class IntroCard extends StatelessWidget {
  Color color;
  String heading;
  String info;
  String imageUrl;
  String gifUrl;
  int index;

  IntroCard({
    this.heading,
    this.color,
    this.imageUrl,
    this.info,
    this.gifUrl,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        color: color,
        width: size.width,
        height: size.height,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageUrl==null
                ? Container(height: size.height * 0.2)
                : Image(image: AssetImage(imageUrl), height: size.height * 0.3),
            SizedBox(
              height: 60,
            ),
            Text(
              heading,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            //TODO: Add Gif for task
            gifUrl==null
                ? Container(height: size.height * 0)
                : Image(image: AssetImage(gifUrl), height: size.height * 0.2),

            SizedBox(
              height: 20,
            ),
            Text(
              info,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index == 0
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Container(),
                index == 3
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        },
                        child: Row(
                          children: [
                            Text(
                              'Let\'s Begin!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    : TextButton.icon(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(
                          'Swipe Left',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
