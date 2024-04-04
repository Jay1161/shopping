// import 'package:flutter/material.dart';
// import 'package:practicals/practicallist.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:PracticalList(),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Chat',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: LoginPage(),
//     );
//   }
// }
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _login(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ChatPage()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to sign in')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _login(context),
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ChatPage extends StatelessWidget {
//   final TextEditingController _messageController = TextEditingController();
//
//   Future<void> _signOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pop(context);
//   }
//
//   Future<void> _sendMessage(String message) async {
//     if (message.trim().isEmpty) return;
//     final user = FirebaseAuth.instance.currentUser;
//     final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
//     final username = userData['username'];
//     await FirebaseFirestore.instance.collection('messages').add({
//       'text': message,
//       'createdAt': Timestamp.now(),
//       'userId': user.uid,
//       'username': username,
//     });
//     _messageController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => _signOut(context),
//           ),
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance.collection('messages').orderBy('createdAt', descending: true).snapshots(),
//               builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
//                 if (chatSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 final chatDocs = chatSnapshot.data!.docs;
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: chatDocs.length,
//                   itemBuilder: (ctx, index) => MessageBubble(
//                     chatDocs[index]['text'],
//                     chatDocs[index]['username'],
//                     chatDocs[index]['userId'] == FirebaseAuth.instance.currentUser!.uid,
//                     key: ValueKey(chatDocs[index].id),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(labelText: 'Send a message...'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () => _sendMessage(_messageController.text),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MessageBubble extends StatelessWidget {
//   final String message;
//   final String username;
//   final bool isMe;
//
//   MessageBubble(this.message, this.username, this.isMe, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           decoration: BoxDecoration(
//             color: isMe ? Colors.blueAccent : Colors.grey[300],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           width: 140,
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//           margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 username,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 message,
//                 style: TextStyle(color: isMe ? Colors.white : Colors.black),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Chat',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ChatScreen(),
//     );
//   }
// }
//
// class ChatScreen extends StatelessWidget {
//   final TextEditingController _textController = TextEditingController();
//
//   void _sendMessage() async {
//     final user = FirebaseAuth.instance.currentUser;
//     final username = user?.displayName ?? user?.email;
//     if (_textController.text.trim().isNotEmpty) {
//       await FirebaseFirestore.instance.collection('chats').add({
//         'text': _textController.text.trim(),
//         'createdAt': Timestamp.now(),
//         'userId': user?.uid,
//         'username': username,
//       });
//       _textController.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Chat'),
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
//                   .collection('chats')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
//                 if (chatSnapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 final chatDocs = chatSnapshot.data!.docs;
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: chatDocs.length,
//                   itemBuilder: (ctx, index) => ListTile(
//                     title: Text(chatDocs[index]['text']),
//                     subtitle: Text(chatDocs[index]['username']),
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
//                     controller: _textController,
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






import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'chat_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blueGrey[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
