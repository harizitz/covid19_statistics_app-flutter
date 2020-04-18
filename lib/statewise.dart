import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detailedstate.dart';

class Statewise extends StatefulWidget {
  @override
  _StatewiseState createState() => _StatewiseState();
}

class _StatewiseState extends State<Statewise> {
  Map data;
  List userData = [];

  Future getData() async {
    http.Response response =
        await http.get("https://api.rootnet.in/covid19-in/stats/latest");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"]["regional"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statewise Count"),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 20.0,
            height: 30.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailedState(data: userData[index])),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "${userData[index]["loc"]}",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          width: 55.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: AssetImage('images/img$index.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
