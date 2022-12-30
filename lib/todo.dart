import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int dateTime;
  @HiveField(3)
  bool isDone;
  //완료되었는지 상태 값을 설정

  Todo({
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });
}
