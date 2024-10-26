import 'package:flutter/material.dart';
import 'package:flutter_dart_internals/keys/checkable_todo_item.dart';

// import 'package:flutter_dart_internals/keys/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';

  final _todos = [
    const Todo(
      'Learn Fluter',
      Priority.normal,
    ),
    const Todo(
      'Learn AWS DevOps Certs',
      Priority.urgent,
    ),
    const Todo(
      'Learn Terraform with EKS',
      Priority.normal,
    ),
    const Todo(
      'Meditate',
      Priority.low,
    ),
    const Todo(
      'Write',
      Priority.normal,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bcomesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bcomesAfterA : -bcomesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                // TodoItem(
                //   todo.text,
                //   todo.priority,
                // ),
                CheckableTodoItem(
                  key: ValueKey(todo.text),
                  // key: ObjectKey(todo),
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        )
      ],
    );
  }
}
