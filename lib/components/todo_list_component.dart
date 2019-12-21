import 'package:flutter/material.dart';
import 'package:flutter_app/components/todo_component.dart';
import 'package:flutter_app/domains/todo.dart';

typedef OnDoneChange(bool, int);

class TodoListComponent extends StatelessWidget {
  final Todos todos;
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
