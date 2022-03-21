import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initializeDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'), // DBのパス
    onCreate: _onCreate,
    onUpgrade: _onUpgrade,
    version: 2,
  );
  return database;
}

// DBが存在しない場合に呼び出す
void _onCreate(
  Database database,
  int version,
) async {
  await _migrate(database, 0, version);
}

// DBが既に存在し、versionが前回より高いに呼び出す
void _onUpgrade(
  Database database,
  int oldVersion,
  int newVersion,
) async {
  await _migrate(database, oldVersion, newVersion);
}

// versionに更新があった際にmigrationを実行する
Future<void> _migrate(Database database, int oldVersion, int newVersion) async {
  for (var i = oldVersion + 1; i <= newVersion; i++) {
    final queries = migrationScripts[i.toString()]!;
    for (final query in queries) {
      await database.execute(query);
    }
  }
}

const migrationScripts = {
  '1': [
    'CREATE TABLE todo(id INTEGER PRIMARY KEY, name TEXT, imagePath TEXT, createdAt TEXT)'
  ],
  '2': ['ALTER TABLE todo ADD COLUMN videoPath TEXT;'],
};
