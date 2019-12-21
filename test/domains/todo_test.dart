import 'package:flutter_app/domains/todo.dart';
import 'package:test/test.dart';

main() {
  group("Todos", () {
    group("#of", () {
      test("should create empty todos", () {
        expect(
          Todos.of([]),
          equals(Todos([]))
        );
      });

      test("should create Todos entry", () {
        expect(
          Todos.of([{ "description": "foo", "done": false }, { "description": "bar", "done": true }]),
          equals(Todos([Todo("foo", false), Todo("bar", true)]))
        );
      });
    });

    group("#add", () {
      test("should create added todos", () {
        expect(
          Todos([]).add(Todo("foo", false)),
          equals(Todos([Todo("foo", false)]))
        );
      });
    });
  });
}
