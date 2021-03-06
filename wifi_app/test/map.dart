<<<<<<< HEAD:wifi_app/lib/map.dart
// //The base format was used from https://flutter.dev/docs/cookbook/lists/mixed-list
// //yes
// import 'dart:html';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp(
//     items: List<ListItem>.generate(
//       1000,
//       (i) => i % 6 == 0
//           ? HeadingItem("Heading $i")
//           : MessageItem("Sender $i", "Message body $i"),
//     ),
//   ));
// }

// class Main extends StatefulWidget {
//   MyApp createState() => MyApp();
// }

// class MyApp extends State<Main> {
//   final List<ListItem> items;

//   MyApp({Key key, @required this.items}) : super(key: key);

=======
//The base format was used from https://flutter.dev/docs/cookbook/lists/mixed-list
//yes
//import 'dart:html';

import 'package:flutter/material.dart';

void main()
{
  runApp(Main());
}

class Main extends StatefulWidget {
  List<ListItem> items;
  MyApp createState() => MyApp(items);
}

class MyApp extends State<Main> {
  List<ListItem> items;
  MyApp(this.items);
  void init()
  {
    items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadingItem("Heading $i")
          : MessageItem("Sender $i", "Message body $i"),
    );
  }
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
          itemCount: items.length,
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
        bottomNavigationBar: BottomNavigationBar(currentIndex: 1, 
          onTap: (currentIndex)
          {
            setState(() {

            });
          },
          items: [
           BottomNavigationBarItem(
               icon: Icon(Icons.list),
               title: Text('List View'),
               backgroundColor: Colors.blue),
           BottomNavigationBarItem(
               icon: Icon(Icons.map),
               title: Text('Graph View'),
               backgroundColor: Colors.blue)
        ]
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
>>>>>>> b1b33eb5bd9582a0463710324368676c7604f854:wifi_app/test/map.dart
//   @override
//   Widget build(BuildContext context) {
//     final title = 'WiFi Finder';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: ListView.builder(
//           // Let the ListView know how many items it needs to build.
//           itemCount: items.length,
//           // Provide a builder function. This is where the magic happens.
//           // Convert each item into a widget based on the type of item it is.
//           itemBuilder: (context, index) {
//             final item = items[index];

//             return ListTile(
//               title: item.buildTitle(context),
//               subtitle: item.buildSubtitle(context),
//             );
//           },
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//             currentIndex: 1,
//             onTap: (currentIndex) {
//               setState(() {});
//             },
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.list),
//                   title: Text('List View'),
//                   backgroundColor: Colors.blue),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.map),
//                   title: Text('Graph View'),
//                   backgroundColor: Colors.blue)
//             ]),
//       ),
//     );
//   }
// }

// /// The base class for the different types of items the list can contain.
// abstract class ListItem {
//   /// The title line to show in a list item.
//   Widget buildTitle(BuildContext context);

//   /// The subtitle line, if any, to show in a list item.
//   Widget buildSubtitle(BuildContext context);
// }

// /// A ListItem that contains data to display a heading.
// class HeadingItem implements ListItem {
//   final String heading;

//   HeadingItem(this.heading);

//   Widget buildTitle(BuildContext context) {
//     return Text(
//       heading,
//       style: Theme.of(context).textTheme.headline5,
//     );
//   }

//   Widget buildSubtitle(BuildContext context) => null;
// }

// /// A ListItem that contains data to display a message.
// class MessageItem implements ListItem {
//   final String sender;
//   final String body;

//   MessageItem(this.sender, this.body);

//   Widget buildTitle(BuildContext context) => Text(sender);

//   Widget buildSubtitle(BuildContext context) => Text(body);
// }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     Widget list = Container(
// //       padding: const EdgeInsets.all(32),
// //       child: Row(
// //         children: [
// //           Expanded(
// //               child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Container(
// //                   padding: const EdgeInsets.only(bottom: 8),
// //                   child: Text(
// //                     'Oeschien Lake Campground',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   )),
// //               Text(
// //                 'Kandersteg, Switzerland',
// //                 style: TextStyle(
// //                   color: Colors.grey[500],
// //                 ),
// //               ),
// //             ],
// //           )),
// //           Icon(
// //             Icons.star,
// //             color: Colors.red[500],
// //           ),
// //           Text('41'),
// //         ],
// //       ),
// //     );

// //     return MaterialApp(
// //       title: 'Free Wifi Mapper',
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Wifi Map'),
// //         ),
// //         body: Column(children: [
// //           list,
// //           buttonSection,
// //         ]),
// //         bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.list),
// //               title: Text('List View'),
// //               backgroundColor: Colors.blue),
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.map),
// //               title: Text('Graph View'),
// //               backgroundColor: Colors.blue)
// //         ]),
// //       ),
// //     );
// //   }
// // }
