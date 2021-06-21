import 'package:cis2203_final_exam/models/review.dart';
import 'package:cis2203_final_exam/models/watchList.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GhibiDatabase {
  static final GhibiDatabase instance = GhibiDatabase._init();

  static Database? _database;

  GhibiDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Ghibi.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableWatchList( 
      ${WatchListFields.id} $idType, 
      ${WatchListFields.filmIndex} $integerType,
      ${WatchListFields.isWatched} $boolType
    ) 
      ''');

    await db.execute('''
    CREATE TABLE $tableReviews( 
      ${ReviewFields.id} $idType, 
      ${ReviewFields.filmIndex} $integerType,
      ${ReviewFields.score} $integerType,
      ${ReviewFields.title} $textType,
      ${ReviewFields.description} $textType
    ) 
      ''');
  }

  //CREATE Functions
  Future<Review> createReview(Review review) async {
    final db = await instance.database;

    final id = await db.insert(tableReviews, review.toJson());
    return review.copy(id: id);
  }

  Future<WatchList> createWatchList(WatchList watchList) async {
    final db = await instance.database;

    final id = await db.insert(tableWatchList, watchList.toJson());
    return watchList.copy(id: id);
  }

  //READ Functions
  Future<WatchList?> readWatchList(String id) async {
    //for checking if a movie already exists in watch list
    final db = await instance.database;

    final maps = await db.query(
      tableWatchList,
      columns: WatchListFields.values,
      where: '${WatchListFields.filmIndex} == ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return WatchList.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<WatchList?>> readAllWatchList() async {
    final db = await instance.database;

    final result =
        await db.query(tableWatchList, groupBy: WatchListFields.isWatched);

    return result.map((json) => WatchList.fromJson(json)).toList();
  }

  Future<List<Review?>> readAllReviews() async {
    final db = await instance.database;

    final result = await db.query(tableReviews);

    return result.map((json) => Review.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
