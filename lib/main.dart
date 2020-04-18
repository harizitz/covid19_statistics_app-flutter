import 'package:covid19/precautions.dart';
import 'package:covid19/statewise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'countrywise.dart';

void main() {
   
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
   
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activecases;
  String recovered;
  String deaths;
  int totalcases;
  Map data;
  Future getData() async {
    http.Response response = await http.get(
        "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true");
    data = json.decode(response.body);
    setState(() {
      totalcases = data["totalCases"];
      activecases = data["activeCases"];
      recovered = data["recovered"];
      deaths = data["deaths"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  SizedBox caseno({Color color, String str}) {
    return SizedBox(
      width: 300.0,
      height: 70.0,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            str,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Covid19 Counts"),
          backgroundColor: Colors.lightGreen[800],
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.public,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Countrywise()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statewise()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.local_hospital,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Safe()),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 20.0, 10.0, 10.0),
                      child: Text(
                        'Indian Statistics',
                        style: TextStyle(
                          fontFamily: 'Oxanium',
                          fontSize: 31.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 70.0,
                      height: 80.0,
                      child: Image.asset('images/flag.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 15.0,
                height: 15.0,
              ),
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: Card(
                  color: Colors.orange[800],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Total Cases : $totalcases ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              caseno(color: Colors.red[800], str: "Active Cases : $activecases "),
              caseno(
                  color: Colors.green[800], str: "Recovered Cases : $recovered "),
              caseno(color: Colors.grey[700], str: "Deaths : $deaths "),
              SizedBox(
                width: 40.0,
                height: 40.0,
              ),
              Text(
                'Central Emergency \nHelpline number : +91-11-23978046 \n',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black87,
                  fontFamily: 'Oxanium',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
