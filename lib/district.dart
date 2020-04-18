import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Districtwise extends StatefulWidget {
  final String data;
  Districtwise({Key key, this.data});
  @override
  _DistrictwiseState createState() => _DistrictwiseState();
}

class _DistrictwiseState extends State<Districtwise> {
  Map districtwise;
  List eachdistrictname = [];
  List eachdistrictcount = [];

  Future getData() async {
    http.Response response =
        await http.get("https://api.covid19india.org/state_district_wise.json");
    districtwise = json.decode(response.body);
    try {
      setState(() {
        eachdistrictcount =
            districtwise['${widget.data}']['districtData'].values.toList();
        eachdistrictname =
            districtwise['${widget.data}']['districtData'].keys.toList();
      });
    } catch ( e) {
      return  print('Sorry ');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
      appBar: AppBar(
        title: Text("Districtwise Count"),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 10.0),
          itemCount:
              eachdistrictname.length == null ? 0 : eachdistrictname.length,
          itemBuilder: (BuildContext context, int index) {
            return 
            info(
                str: "${index + 1}. ${eachdistrictname[index]}",
                count: "${eachdistrictcount[index]["confirmed"].toString()}");
          }),
    );
  }
}
