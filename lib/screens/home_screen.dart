import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_list.dart';
import './login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = [];

  void _addTodoItem(String title) {
    if (title.isNotEmpty) {
      setState(() {
        _todos.add(Todo(title: title));
      });
      _textFieldController.clear();
    }
  }

  void _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Then navigate to the LoginScreen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) =>
                    false, // Remove all routes below the pushed route
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: 'Add a new task',
              ),
              onSubmitted: _addTodoItem,
            ),
          ),
          Expanded(
            child: TodoList(
              todos: _todos,
              onTodoToggle: _toggleTodo,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Add Todo'),
              content: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: 'Todo text here'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      _addTodoItem(_textFieldController.text);
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK')),
              ],
            ),
          );
        },
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
