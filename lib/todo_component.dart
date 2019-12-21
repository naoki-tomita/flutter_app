import 'package:flutter/material.dart';

class Todo {
  final String description;
  final bool done;
  Todo(this.description, this.done);

  setDone(bool done) {
    return Todo(description, done);
  }
}

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
