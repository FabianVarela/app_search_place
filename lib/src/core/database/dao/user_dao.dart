import 'package:drift/drift.dart';
import 'package:my_app/src/core/database/database.dart';
import 'package:my_app/src/core/database/table/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(this.appDb) : super(appDb);

  final AppDatabase appDb;

  Future<int> saveUser(Insertable<User> user) async {
    return into(users).insert(user);
  }

  Future<User?> getUser(String username, String password) async {
    final user = select(users)
      ..where((u) => u.username.equals(username))
      ..where((u) => u.password.equals(password));

    return user.getSingleOrNull();
  }

  Stream<User?> isLoggedIn(int id) {
    final userActive = select(users)
      ..where((u) => u.id.equals(id))
      ..where((u) => u.isLoggedIn.equals(true));

    return userActive.watchSingleOrNull();
  }

  Future<int> setLoggedIn(int id, {required bool value}) {
    return (update(users)..where((u) => u.id.equals(id))).write(
      UsersCompanion(isLoggedIn: Value(value)),
    );
  }
}
