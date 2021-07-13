import 'package:lista_contato_db/app/database/sqlite/scipt.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection{
  static Database _db;

static Future<Database> get() async {
  if(_db == null){
    String path = join(await getDatabasesPath(),'banco_contatos');
    deleteDatabase(path);
    _db = await openDatabase(
    path,
    version: 1,
    onCreate: (db, v) {
      db.execute(createTable);
      db.execute(insert1);
      db.execute(insert2);
      db.execute(insert3);

    }
      
    
    );

  }
  return _db;
  }
  
}