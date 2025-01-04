import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter09/floor_db/todo_dao.dart';
import 'package:flutter09/floor_db/todo_entity.dart';


part 'todo_database.g.dart';

@Database(version: 1, entities: [TodoEntity])
abstract class TodoDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
