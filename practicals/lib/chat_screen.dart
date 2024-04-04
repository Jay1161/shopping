// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class ChatScreen extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   void _sendMessage() {
//     if (_controller.text.isEmpty) return;
//
//     FirebaseFirestore.instance.collection('chat').add({
//       'text': _controller.text,
//       'createdAt': Timestamp.now(),
//       'userId': FirebaseAuth.instance.currentUser!.uid,
//     });
//
//     _controller.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat App'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('chat')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
//                 if (chatSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 final chatDocs = chatSnapshot.data!.docs;
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: chatDocs.length,
//                   itemBuilder: (ctx, index) => ListTile(
//                     title: Text(chatDocs[index]['text']),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(labelText: 'Send a message...'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class ChatBubble extends StatelessWidget {
//   final String message;
//   final bool belongsToCurrentUser;
//
//   ChatBubble({required this.message, required this.belongsToCurrentUser});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: belongsToCurrentUser
//           ? MainAxisAlignment.end
//           : MainAxisAlignment.start,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: belongsToCurrentUser ? Colors.blue : Colors.grey,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//               bottomLeft: belongsToCurrentUser ? Radius.circular(12) : Radius.zero,
//               bottomRight: belongsToCurrentUser ? Radius.zero : Radius.circular(12),
//             ),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//           margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//           child: Text(
//             message,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class ChatScreen extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   void _sendMessage() {
//     if (_controller.text.isEmpty) return;
//
//     FirebaseFirestore.instance.collection('chat').add({
//       'text': _controller.text,
//       'createdAt': Timestamp.now(),
//       'userId': FirebaseAuth.instance.currentUser!.uid,
//     });
//
//     _controller.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat App'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('chat')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
//                 if (chatSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 final chatDocs = chatSnapshot.data!.docs;
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: chatDocs.length,
//                   itemBuilder: (ctx, index) => ChatBubble(
//                     message: chatDocs[index]['text'],
//                     belongsToCurrentUser: chatDocs[index]['userId'] ==
//                         FirebaseAuth.instance.currentUser!.uid,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(labelText: 'Send a message...'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class ChatBubble extends StatelessWidget {
//   final String message;
//   final bool belongsToCurrentUser;
//
//   ChatBubble({required this.message, required this.belongsToCurrentUser});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: belongsToCurrentUser
//           ? MainAxisAlignment.end
//           : MainAxisAlignment.start,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: belongsToCurrentUser ? Colors.blue : Colors.grey,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//               bottomLeft: belongsToCurrentUser ? Radius.circular(12) : Radius.zero,
//               bottomRight: belongsToCurrentUser ? Radius.zero : Radius.circular(12),
//             ),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//           margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//           child: Text(
//             message,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class ChatScreen extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();
//
//   void _sendMessage() {
//     if (_controller.text.isEmpty) return;
//
//     FirebaseFirestore.instance.collection('chat').add({
//       'text': _controller.text,
//       'createdAt': Timestamp.now(),
//       'userId': FirebaseAuth.instance.currentUser!.uid,
//     });
//
//     _controller.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat App'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('chat')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
//                 if (chatSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 final chatDocs = chatSnapshot.data!.docs;
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: chatDocs.length,
//                   itemBuilder: (ctx, index) => ChatBubble(
//                     message: chatDocs[index]['text'],
//                     belongsToCurrentUser: chatDocs[index]['userId'] ==
//                         FirebaseAuth.instance.currentUser!.uid,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       labelText: 'Send a message...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool belongsToCurrentUser;

  ChatBubble({required this.message, required this.belongsToCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurrentUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: belongsToCurrentUser ? Radius.circular(12) : Radius.zero,
              bottomRight: belongsToCurrentUser ? Radius.zero : Radius.circular(12),
            ),
          ),
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(
              color: belongsToCurrentUser ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    FirebaseFirestore.instance.collection('chat').add({
      'text': _controller.text,
      'createdAt': Timestamp.now(),
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practical-9 Chat App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final chatDocs = chatSnapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) => ChatBubble(
                    message: chatDocs[index]['text'],
                    belongsToCurrentUser: chatDocs[index]['userId'] ==
                        FirebaseAuth.instance.currentUser!.uid,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}