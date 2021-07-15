import 'package:flutter/material.dart';

List get_stuff_list(String item) {
  
  List stuff_list = ['keys', 'wallet', 'phone', 'mask', 'hand sanitiser'];

  if (item == 'Work') {
    stuff_list.add('work id card');
    stuff_list.add('latpop');
  } else
  if (item == 'Party') {
    stuff_list.add('lipstick');
    stuff_list.add('earrings');
    stuff_list.add('gift');
    stuff_list.add('wine');
  } else
  if (item == 'Park') {
    stuff_list.add('picnic blanket');
    stuff_list.add('insect repellent');
  } else
  if (item == 'Gym') {
    stuff_list.add('water bottle');
    stuff_list.add('towel');
    stuff_list.add('change of clothes');
  } else
  if (item == 'Day Out') {
    stuff_list.add('cardigan');
    stuff_list.add('snack');
  } 

  return stuff_list;

}

class MyDetails extends StatelessWidget {

  final item;
  MyDetails(this.item);

  @override
  Widget build(BuildContext context) {
    final title = 'what to take to... $item';

    List stuff_list = get_stuff_list(item);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
