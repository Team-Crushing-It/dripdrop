// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class RealtimeData extends StatefulWidget {
//   @override
//   _RealtimeDataState createState() => _RealtimeDataState();
// }

// class _RealtimeDataState extends State<RealtimeData> {
//   final databaseReference = Firestore.instance;

//   Widget _buildList(BuildContext context, DocumentSnapshot document) {
//     return Container(
//       // child: Text(document['TDS']),
//       //or Text(document['EC']),
//       //or Text(document['pH']),
//       //or Text(document['temperature']),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200.0,
//       height: 100.0,
//       child: StreamBuilder(
//         stream: Firestore.instance.collection('realtimePoints').snapshots(),
//         //print an integer every 2secs, 10 times
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Text("Loading..");
//           }
//           print(snapshot.data.documents[0].data);
//           return _buildList(context, snapshot.data.documents[0]);
//         },
//       ),
//     );
//     //Insert goodies h
//   }
// }

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RealtimeData extends StatefulWidget {
  @override
  _RealtimeDataState createState() => _RealtimeDataState();
}

class _RealtimeDataState extends State<RealtimeData> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //insert streambuilder here
          Container(width: 140, height: 80, color: Colors.blue),
          Container(width: 140, height: 80, color: Colors.yellow),
        ],
      ),
    );
    //Insert goodies h
  }
}
