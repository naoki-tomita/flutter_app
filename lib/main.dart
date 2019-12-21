import 'package:flutter/material.dart';
import 'package:flutter_app/todo_component.dart';
import 'package:flutter_app/todo_input_component.dart';
import 'package:flutter_app/todo_list_component.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Todo Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoListComponent(todos: _todos, onDoneChange: (val, i) => setState(() => _todos[i] = _todos[i].setDone(val))),
      bottomNavigationBar: Container(
        child: TodoInputComponent(onInput: (value) => setState(() => _todos.add(Todo(value, false)))),
        margin: EdgeInsets.only(left: 4, right: 4, bottom: 4)
      )
    );
  }
}
