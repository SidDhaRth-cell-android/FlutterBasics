import 'package:sqflite/sqflite.dart';

final String tableMovie = 'movie';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDescription = 'description';
final String columnFavourite = 'favourite';

class Movie {
  int? id;
  String? title;
  String? description;
  int? isFavourite;

  Movie(this.id, this.title, this.description, this.isFavourite);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDescription: description,
      columnFavourite: isFavourite
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Movie.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int?;
    title = map[columnTitle] as String?;
    description = map[columnDescription] as String?;
    isFavourite = map[columnFavourite] as int?;
  }
}

class MovieProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableMovie ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnDescription text not null,
  $columnFavourite integer not null)
''');
    });
  }

  Future<Movie> insert(Movie movie) async {
    movie.id = await db.insert(tableMovie, movie.toMap());
    return movie;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableMovie, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getMovies() async {
    return await db.rawQuery('SELECT * FROM "$tableMovie"');
  }

  Future<int> update(Movie todo) async {
    return await db.update(tableMovie, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}
