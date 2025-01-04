import 'package:floor/floor.dart';
import 'package:flutter09/floor_db/todo_entity.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM TodoEntity')
  Future<List<TodoEntity>> findAllTodo();

  @insert
  Future<void> insertTodo(TodoEntity todo);

  @delete
  Future<void> deleteTodo(TodoEntity todo);
}
