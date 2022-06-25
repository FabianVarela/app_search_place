import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get username => text()();

  TextColumn get password => text()();

  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(false))();
}
