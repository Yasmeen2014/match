import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Match the pictures'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List imageL = [
    'images/image-1.png',
    'images/image-2.png',
    'images/image-3.png',
    'images/image-4.png',
    'images/image-5.png',
    'images/image-6.png',
    'images/image-7.png',
    'images/image-8.png',
    'images/image-9.png'
  ];
  Random r = Random();

  @override
  Widget build(BuildContext context) {
    int x = r.nextInt(imageL.length);

    int y = r.nextInt(imageL.length);
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                if (x != y) setState(() {});
              },
              child: Text(
                "Try Again",
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(imageL[x]),
                  ),
                ),
                Expanded(
                  child: Image(
                    image: AssetImage(imageL[y]),
                  ),
                ),
              ],
            ),
            x == y
                ? Text(
                    "you win",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
          ],
        ),
        Positioned(
          left: 20,
          top: 20,
          child: x == y
              ? IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.refresh))
              : SizedBox(),
        ),
      ],
    );
  }
}
