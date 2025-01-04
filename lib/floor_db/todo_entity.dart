import 'package:floor/floor.dart';

@entity
class TodoEntity {
  @PrimaryKey(autoGenerate: true)
  final int id = 0;

  String? title;

  String? description;

  TodoEntity(this.title, this.description);
}
