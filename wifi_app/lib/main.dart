//The base format was used from https://flutter.dev/docs/cookbook/lists/mixed-list

import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

//Insert JSON data here to display
//change size to the number of items in the JSON list

String arrayObjsText =
    '{"tags": [{"title": "Sisters Coffee Company","address":"273 W Hood Ave,Sisters, OR 97759","distance": 2027},{"title": "Sisters Library","address": "110 N Cedar St,Sisters, OR 97759","distance": 2536}]}';

class Tag {
  String title;
  String address;
  int distance;

  Tag(this.title, this.address, this.distance);

  factory Tag.fromJson(dynamic json) {
    return (Tag(json['title'] as String, json['address'] as String,
        json['distance'] as int));
  }
  @override
  String toString() {
    return '{ ${this.title}, ${this.address}, ${this.distance} }';
  }
}

int size = 2;
void main() {
  var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
  List<Tag> tagObjs =
      tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
  List<ListItem> arrayFinal = new List(10);
  int count = 0;

  for (int i = 0; i < (size * 3); i++) {
    if ((i % 3) == 0) {
      arrayFinal[count] = HeadingItem(tagObjs[(i / 3).floor()].title);
      count++;
    }
    if ((i % 3) == 1) {
      arrayFinal[count] = MessageItem(tagObjs[(i / 3).floor()].address,
          tagObjs[(i / 3).floor()].distance.toString());
      count++;
    }
  }

  runApp(MyApp(arrayFinal));
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  MyApp(this.items);

  @override
  Widget build(BuildContext context) {
    final title = 'WiFi Finder';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: (size * 2),
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List View'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Graph View'),
              backgroundColor: Colors.blue)
        ]),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}

// String getJson() {
//   var data = getData('http://10.0.2.2:5000/');
//   return data.toString();
// }

//     return MaterialApp(
//       title: 'Free Wifi Mapper',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Wifi Map'),
//         ),
//         body: Column(children: [
//           list,
//           buttonSection,
//         ]),
//         bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.list),
//               title: Text('List View'),
//               backgroundColor: Colors.blue),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.map),
//               title: Text('Graph View'),
//               backgroundColor: Colors.blue)
//         ]),
//       ),
//     );
//   }
// }
