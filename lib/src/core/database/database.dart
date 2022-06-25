import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:my_app/src/core/database/dao/user_dao.dart';
import 'package:my_app/src/core/database/table/user_table.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Users], daos: [UserDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          LazyDatabase(() async {
            final dbFolder = await getApplicationDocumentsDirectory();
            final file = File(path.join(dbFolder.path, 'search.sqlite'));

            return NativeDatabase(file);
          }),
        );

  @override
  int get schemaVersion => 1;
}
