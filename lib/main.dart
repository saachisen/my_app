import 'package:my_app/details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String> places = [
    'Work',
    'Party',
    'Park',
    'Gym',
    'Day Out'
  ];

  List<String> transports = [
    'Walk',
    'Tube',
    'Drive',
    'Cycle'
  ];

  List<String> durations = [
    'Hour',
    'Half Day',
    'Day',
  ];

  @override
  Widget build(BuildContext context) {
    final title = 'AllTheStuff';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${places[index]}'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyDetails(places[index])));
              },
            );
          },
        ),
      ),
    );
  }
}
