// import 'dart:html';

import 'package:flutter/material.dart';

List get_stuff_list(String weatherState, double temp, String place) {
// List get_stuff_list(String weatherState, String place) {
// List get_stuff_list(String place) {

  List stuff_list = ['keys', 'wallet', 'phone', 'mask', 'hand sanitiser'];

  print (weatherState);

  print(temp.toString());

  // expand list of stuff depending on today's weather 
  if (weatherState == 'Heavy Rain') {
    stuff_list.add('umbrella');
  } else
    if (weatherState == 'Clear') {
    stuff_list.add('sunglasses');
    stuff_list.add('sunscreen');
  }

  if (temp > 20.0) {
    stuff_list.add('water bottle');
  } else
    if (temp < 10.0) {
    stuff_list.add('gloves');
    stuff_list.add('wooly hat');
    stuff_list.add('scarf');
  } else 
  if (temp > 40.0 || temp < -10.0) {
    stuff_list.add('oh my god please do not go out');
  }

  // expand list of stuff depending on where you're going today
  if (place == 'Work') {
    stuff_list.add('work id card');
    stuff_list.add('latpop');
  } else
  if (place == 'Party') {
    stuff_list.add('lipstick');
    stuff_list.add('earrings');
    stuff_list.add('gift');
    stuff_list.add('wine');
  } else
  if (place == 'Park') {
    stuff_list.add('picnic blanket');
    stuff_list.add('insect repellent');
  } else
  if (place == 'Gym') {
    stuff_list.add('water bottle');
    stuff_list.add('towel');
    stuff_list.add('change of clothes');
  } else
  if (place == 'Day Out') {
    stuff_list.add('cardigan');
    stuff_list.add('snack');
  } 

  return stuff_list;

}

class MyDetails extends StatelessWidget {

  final String itemState;
  final double itemTemp;
  final String itemPlace;

  MyDetails(this.itemState, this.itemTemp, this.itemPlace);
  // MyDetails(this.itemState, this.itemPlace);
  // MyDetails(this.itemPlace);

  @override
  Widget build(BuildContext context) {
    final title = "Here's what to take to... $itemPlace";

    // List stuff_list = get_stuff_list(itemPlace);
    // List stuff_list = get_stuff_list(itemState, itemPlace);
    List stuff_list = get_stuff_list(itemState, itemTemp, itemPlace);

    return Scaffold(
        appBar: AppBar(
          title: Text(title,
                    style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 15),
              ),
        ),
        // body: Text('You selected $isDartCool'),
        body: ListView.builder(
          itemCount: stuff_list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${stuff_list[index]}')
            );
          },
        ),
    );
  }
}
