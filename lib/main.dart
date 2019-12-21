import 'package:flutter/material.dart';
import 'package:flutter_app/usecases/todo_usecase.dart';

import 'components/todo_input_component.dart';
import 'components/todo_list_component.dart';
import 'domains/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

class TodoState {
  Todos todos;
}

final state = TodoState();
final usecase = TodoUsecase(TodoGateway(LocalStorageDriver(), state));

class _MyHomePageState extends State<MyHomePage> {
  final todoState = state;

  Todos get _todos => todoState.todos;

  @override
  void initState() {
    super.initState();
    usecase.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: TodoListComponent(todos: _todos, onDoneChange: (val, i) => setState(() => usecase.store(_todos.setDone(val, i)))),
      bottomNavigationBar: Container(
        child: TodoInputComponent(onInput: (value) => setState(() => usecase.store(_todos.add(Todo(value, false))))),
        margin: EdgeInsets.only(left: 4, right: 4, bottom: 4)
      )
    );
  }
}
