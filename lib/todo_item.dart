import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(todo) onDelete;

  const TodoItem(
      {required this.todo,
      required this.onTap,
      required this.onDelete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //클릭하면 클릭됐다고 리스트 스크린에 알려줌
        onTap(todo);
      },
      leading: todo.isDone
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.check_circle_outline),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
        DateFormat.yMMMd()
            .format(DateTime.fromMicrosecondsSinceEpoch(todo.dateTime)),
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              onTap: onDelete(todo),
              child: const Icon(Icons.delete_forever),
            )
          : null,
    );
  }
}
