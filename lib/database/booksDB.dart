import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/book.dart';

class BooksDatabase {
  static final BooksDatabase instance = BooksDatabase._init();

  static Database? _database;

  BooksDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!; // if database already exist


    // if not then initialize database
    _database = await _initDB('books.db');
    return _database!;
  }


  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath(); // database path
    final path = join(dbPath, filepath); // path fore books database

    return await openDatabase(path, version: 1, onCreate: _createDB); // open database
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableBooks ( 
        ${BooksFields.id} $idType, 
        ${BooksFields.title} $textType,
        ${BooksFields.dateAdded} $textType,
        ${BooksFields.imageUri} $textType,
        ${BooksFields.description} $textType
      )
    ''');// run query to create table books
  }

  Future<Book> create(Book book) async {
    final db = await instance.database;

    // insert into table Books values book.toJson
    final id = await db.insert(tableBooks, book.toJson());

    return book.copy(id: id); // copy back the id
  }

  Future<Book> readBook(int id) async{
    final db = await instance.database;

    // query
    final maps = await db.query(
      tableBooks, // table name
      columns: BooksFields.values,  // select which column
      where: '$BooksFields.id} = ?',
      whereArgs: [id],  // condition (prevent sql injection)
    ); // return of book in json

    if (maps.isNotEmpty){
      return Book.fromJson(maps.first);  // return first result and conver to book from json
    } else {
      throw Exception('ID: $id not found'); // if book not found
    }
  }

  Future<List<Book>> readAllBooks() async {
    final db = await instance.database;

    final orderBy = '${BooksFields.title} ASC';

    final result = await db.query(tableBooks, orderBy: orderBy);

    return result.map((json) => Book.fromJson(json)).toList();
  }

  Future<int> update(Book book) async {
    final db = await instance.database;

    return db.update(
      tableBooks,  // table name
      book.toJson(),  // updated book
      where: '${BooksFields.id} = ?',
      whereArgs: [book.id],  // condition
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableBooks,  // table name
      where: '${BooksFields.id} = ?',
      whereArgs: [id],  // condition
    );

  }


  Future close() async {
    final db = await instance.database;

    db.close();
  }
}