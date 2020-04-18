import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Countrywise extends StatefulWidget {
  @override
  _CountrywiseState createState() => _CountrywiseState();
}

class _CountrywiseState extends State<Countrywise> {
  List<dynamic> eachcountry = [];
  List data = [];
  Future getData() async {
    http.Response response = await http.get(
        "https://corona.lmao.ninja/v2/countries?yesterday=false&sort=cases");
    data = json.decode(response.body);
    setState(() {
      eachcountry = data;
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
        title: Text("Countrywise Count"),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: eachcountry.length == null ? 0 : eachcountry.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(
                '${eachcountry[index]["countryInfo"]["flag"]}',
                width: 50.0,
                height: 50.0,
              ),
              title: Text("${index + 1}. ${eachcountry[index]["country"]}"),
              subtitle: Text("Total cases: ${eachcountry[index]["cases"]}"),
            );
          }),
    );
  }
}
