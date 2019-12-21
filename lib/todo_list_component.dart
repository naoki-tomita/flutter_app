import 'package:flutter/material.dart';
import 'package:flutter_app/todo_component.dart';

typedef OnDoneChange(bool, int);

class TodoListComponent extends StatelessWidget {
  final List<Todo> todos;
  final OnDoneChange onDoneChange;
  TodoListComponent({ this.todos, this.onDoneChange });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => TodoComponent(todo: todos[i], onDoneChange: (val) => onDoneChange(val, i)),
      itemCount: todos.length,
    );
  }
}
