import 'package:flutter/material.dart';

// void main() {
//   runApp(TodoListApp());
// }
//
// class TodoListApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo List App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: TodoListScreen(),
//     );
//   }
// }

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  List<String> todos = [
    'Learning Flutter',
    'Building a Flutter app',
    'Practical-4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _buildTodoListView(),
          ),
          Expanded(
            child: _buildColorGridView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoListView() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                todos.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  void _addTodoDialog(BuildContext context) {
    String newTodo = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'Enter your todo'),
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                if (newTodo.isNotEmpty) {
                  // Add the new todo to the list
                  setState(() {
                    todos.add(newTodo);
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // Add this code snippet below the _addTodoDialog method

  Widget _buildColorGridView() {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(9, (index) {
          return Container(
            width: 100.0,
            color: Colors.primaries[index],
            margin: EdgeInsets.all(4.0),
          );
        }),
      ),
    );
  }
}
