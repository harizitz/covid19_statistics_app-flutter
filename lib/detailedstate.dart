import 'package:flutter/material.dart';
import 'district.dart';

class DetailedState extends StatefulWidget {
  final Map data;
  DetailedState({Key key, this.data});

  @override
  _DetailedStateState createState() => _DetailedStateState();
}

class _DetailedStateState extends State<DetailedState> {
  Row info({String str, String count}) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 30.0, 40.0, 10.0),
        ),
        Expanded(
          child: Text(
            str,
            style: TextStyle(
              fontFamily: 'Oxanium',
              fontSize: 17.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 70.0, 0.0),
          child: Text(
            count,
            style: TextStyle(
              fontFamily: 'Oxanium',
              fontSize: 17.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Covid19 Count Tracker"),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 10.0,
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 10.0),
                  child: Center(
                    child: Text(
                      '${widget.data["loc"]}',
                      style: TextStyle(
                        fontFamily: 'Oxanium',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('images/location.gif'),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30.0,
            height: 50.0,
          ),
          info(
              str: 'Total Confirmed Cases',
              count: '${widget.data["totalConfirmed"]}'),
          info(str: 'Discharged Cases', count: '${widget.data["discharged"]}'),
          info(str: 'Deaths ', count: '${widget.data["deaths"]}'),
          info(
              str: 'Confirmed Cases Indian ',
              count: '${widget.data["confirmedCasesIndian"]}'),
          info(
              str: 'Confirmed Cases Foreign ',
              count: '${widget.data["confirmedCasesForeign"]}'),

          SizedBox(
            width: 30.0,
            height: 40.0,
          ),
          FlatButton(
            color: Colors.pink,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.pinkAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Districtwise(data: widget.data["loc"]),
                  ));
            },
            child: Text(
              "Districtwise Count",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
