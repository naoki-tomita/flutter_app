import 'package:flutter/material.dart';
import 'package:flutter_app/domains/todo.dart';

typedef OnDoneChange(bool value);

class TodoComponent extends StatelessWidget {
  final Todo todo;
  final OnDoneChange onDoneChange;
  TodoComponent({ this.todo, this.onDoneChange });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: todo.done, onChanged: (val) => this.onDoneChange(val)),
        Text(todo.description),
      ],
    );
  }

}
