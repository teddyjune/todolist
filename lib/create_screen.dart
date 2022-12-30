import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos!.add(Todo(
                  title: _controller.text,
                  dateTime: DateTime.now()
                      //저장값을 int로 변환해준다.
                      .millisecondsSinceEpoch));
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: '할 일을 입력하세요',
          ),
        ),
      ),
    );
  }
}
