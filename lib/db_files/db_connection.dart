import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'user');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE item(id INTEGER PRIMARY KEY, title TEXT, price TEXT, image TEXT)");
    await database.execute(
        "CREATE TABLE cart(id INTEGER PRIMARY KEY, amount INTEGER, FOREIGN KEY (id) REFERENCES item (id) ON DELETE NO ACTION ON UPDATE NO ACTION)");
  }
}
