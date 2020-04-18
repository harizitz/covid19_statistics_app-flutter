import 'package:flutter/material.dart';

class Safe extends StatefulWidget {
  @override
  _SafeState createState() => _SafeState();
}

class _SafeState extends State<Safe> {
  Expanded images({String simg}) {
    return Expanded(
      child: Container(
        child: Image.asset(
          simg,
          height: 100.0,
          width: 100.0,
        ),
      ),
    );
  }

  Expanded notation({String disname}) {
    return Expanded(
      child: Center(
        child: Text(
          disname,
          style: TextStyle(
            fontFamily: 'Oxanium',
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Precautions"),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              'Symptoms\n',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red[900],
                fontFamily: 'Oxanium',
              ),
            ),
            Row(
              children: <Widget>[
                images(simg: 'images/cold.gif'),
                images(simg: 'images/cough.gif'),
                images(simg: 'images/fever.gif'),
              ],
            ),
            Row(
              children: <Widget>[
                notation(disname: 'Cold'),
                notation(disname: 'Cough'),
                notation(disname: 'Fever'),
              ],
            ),
            Text(
              '\nPrevention Techniques\n',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red[900],
                fontFamily: 'Oxanium',
              ),
            ),
            Row(
              children: <Widget>[
                images(simg: 'images/stayhome.gif'),
                images(simg: 'images/distance.gif'),
                images(simg: 'images/sanitizer.gif'),
              ],
            ),
            Row(
              children: <Widget>[
                notation(disname: 'Stay Home\nStay Safe'),
                notation(disname: 'Maintain social distance'),
                notation(disname: 'Use Sanitizer'),
              ],
            ),
            Row(
              children: <Widget>[
                images(simg: 'images/washhands.gif'),
                images(simg: 'images/mask.gif'),
                images(simg: 'images/fruits.gif'),
              ],
            ),
            Row(
              children: <Widget>[
                notation(disname: 'Wash your hands'),
                notation(disname: 'Wear Mask'),
                notation(disname: 'Eat Immune rich fruits'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
