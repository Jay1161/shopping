// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: ChatBody(),
//     );
//   }
// }
//
// class ChatBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('messages').snapshots(),
//       builder: (ctx, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         final documents = snapshot.data!.docs;
//         return ListView.builder(
//           itemCount: documents.length,
//           itemBuilder: (ctx, index) => ListTile(
//             title: Text(documents[index]['text']),
//             subtitle: Text(documents[index]['username']),
//           ),
//         );
//       },
//     );
//   }
// }
