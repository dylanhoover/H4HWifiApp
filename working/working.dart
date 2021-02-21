import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschien Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Free Wifi Mapper',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wifi Map'),
        ),
        body: Column(children: [
          titleSection,
          buttonSection,
        ]),
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

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

//   Row _buildTextRow(Color color, IconData icon) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//         Expanded(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child: Text(
//                   'Oeschien Lake Campground',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//             Text(
//               'Kandersteg, Switzerland',
//               style: TextStyle(
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//         Icon(
//           Icons.star,
//           color: Colors.red[500],
//         ),
//         Text('41'),
//         //),
//       ],
//     );
//   }
// }

// Row _buildTextRow(double distance, String title, String address) {
//   String distance_output = '' + distance.toString() + ' mi.';
//   return Row(
//     children: [
//       Expanded(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               )),
//           Text(
//             address,
//             style: TextStyle(
//               color: Colors.grey[500],
//             ),
//           ),
//         ],
//       )),
//       Icon(
//         Icons.star,
//         color: Colors.red[500],
//       ),
//       Text(distance_output),
//     ],
//   );
// }

// Widget titleSection = Container(
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
