import 'dart:html';
import 'dart:convert';

import 'package:flutter_app/domains/todo.dart';

import '../main.dart';

class LocalStorageDriver {
  store(String json) {
    print(json);
    window.localStorage.addAll({ "key": json });
  }

  String get() {
    return window.localStorage["key"];
  }
}

abstract class TodoPort {
  void store(Todos todos);
  Todos get();
}

class TodoGateway implements TodoPort {
  final LocalStorageDriver localStorageDriver;
  final TodoState todoState;
  TodoGateway(this.localStorageDriver, this.todoState);

  @override
  store(Todos todos) {
    final json = jsonEncode(todos.map((it) => ({ "description": it.description, "done": it.done })));
    print(json);
    localStorageDriver.store(json);
    todoState.todos = todos;
  }

  @override
  Todos get() {
    final str = localStorageDriver.get();
    if (str == null) {
      return Todos([]);
    }
    final List<dynamic> obj = jsonDecode(str);
    return Todos(obj.map((it) => Todo(it["description"], it["done"])).toList());
  }
}

class TodoUsecase {
  final TodoGateway todoGateway;
  TodoUsecase(this.todoGateway);

  store(Todos todos) {
    todoGateway.store(todos);
  }

  load() {
    final todos = todoGateway.get();
    todoGateway.store(todos);
  }
}
