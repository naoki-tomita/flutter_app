typedef V MapConvert<T, V>(T);

class FCC<T> {
  final List<T> values;
  FCC(this.values);

  int get length => values.length;

  T operator [](Object key) {
    return values[key];
  }

  add(T element) => values..add(element);

  List<V> map<V>(MapConvert<T, V> fn) {
    return values.map(fn).toList();
  }
}

class Todo {
  final String description;
  final bool done;
  Todo(this.description, this.done);

  operator ==(Object other) {
    if (other is Todo) {
      return other.description == description && other.done == done;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}

class Todos extends FCC<Todo> {
  Todos(List<Todo> values) : super(values);

  Todos setDone(bool done, int index) => Todos(
    values
    ..[index] = Todo(values[index].description, done)
  );

  static Todos get empty => Todos([]);

  Todos add(Todo element) => Todos(super.add(element));

  static Todos of(List<Map<String, dynamic>> object) => Todos(object.map((it) => Todo(it["description"], it["done"])).toList());

  @override
  bool operator ==(Object other) {
    if (other is Todos) {
      if (length != other.length) {
        return false;
      }
      for (int i = 0; i < length; i++) {
        if (this[i] != other[i]) {
          print(this[i]);
          print(other[i]);
          return false;
        }
      }
      return true;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}
