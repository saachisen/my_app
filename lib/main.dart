import 'package:my_app/model.dart';
import 'package:my_app/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AllTheStuff',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(
        title: 'AllTheStuff',
        key: null,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<String> _loadRemoteData() async {
  final response = await (http
      .get(Uri.parse('https://www.metaweather.com/api/location/44418/'))); // weather currently hardcoded to London, UK
                                                                           // for more interesting results, try replacing '44418' with '12586539' (Mumbai!)
  if (response.statusCode == 200) {
    print('response statusCode is 200');
    return response.body;
  } else {
    print('Http Error: ${response.statusCode}!');
    throw Exception('Invalid data source.');
  }
}


class _MyHomePageState extends State<MyHomePage> {
  Future<DataSeries> fetchQuests() async {
    String jsonString = await _loadRemoteData();
    print('jsonString: ${jsonString}');

    final jsonResponse = json.decode(jsonString);
    print('jsonResponse: ${jsonResponse}');

    DataSeries dataSeries = new DataSeries.fromJson(jsonResponse);

    return dataSeries;
  }

  late Future<DataSeries> dataSeries;

  List<String> places = [
    'Work',
    'A Party',
    'The Park',
    'The Gym',
    'A Day Out'
  ];

  @override
  void initState() {
    super.initState();
    dataSeries = fetchQuests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
                Text(
                'AllTheStuff',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text("So where are you going today?",
              style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 15),
              ),
            ]
           )
        ),
      body: FutureBuilder<DataSeries>(
          future: dataSeries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${places[index]}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDetails(
                                  snapshot.data!.dataModel[0].state, // index 0 has today's weather
                                  snapshot.data!.dataModel[0].temp,
                                  places[index])));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
