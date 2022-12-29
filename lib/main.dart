import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/list_screen.dart';
import 'package:todolist/todo.dart';

//어디에서나 쓸 수 있다. 초보라서 어디서든 가져다쓰기 편하게 해 놓은 것.
late final Box<Todo> todos;

void main() async {
  //hive 초기화 코드
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  Box<Todo> todos = await Hive.openBox<Todo>('todolist.db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListScreen(),
    );
  }
}
