//The base format was used from https://flutter.dev/docs/cookbook/lists/mixed-list

import 'package:flutter/material.dart';

void main() {
  var list1 = List(3);
  list1[0] = 1;
  list1[1] = 2;
  list1[2] = 3;
  runApp(MyApp(list1));
}

class MyApp extends StatelessWidget {
  List<ListItem> myList;
  MyApp(List<ListItem> myList);
  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
    int size = 3;

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: size,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = myList[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget list = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: Text(
//                     'Oeschien Lake Campground',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )),
//               Text(
//                 'Kandersteg, Switzerland',
//                 style: TextStyle(
//                   color: Colors.grey[500],
//                 ),
//               ),
//             ],
//           )),
//           Icon(
//             Icons.star,
//             color: Colors.red[500],
//           ),
//           Text('41'),
//         ],
//       ),
//     );

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
