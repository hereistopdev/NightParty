import 'package:flutter/material.dart';
import '../models/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTodoToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: todos.map((Todo todo) {
        return CheckboxListTile(
          title: Text(todo.title),
          value: todo.isDone,
          onChanged: (bool? newValue) {
            onTodoToggle(todo, newValue!);
          },
        );
      }).toList(),
    );
  }
}
