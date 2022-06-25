import 'package:drift/drift.dart';
import 'package:my_app/src/core/database/database.dart';
import 'package:my_app/src/features/register/domain/entity/register_entity.dart';

class RegisterRepository {
  RegisterRepository({required this.appDb});

  late final AppDatabase appDb;

  Future<void> registerUser(RegisterEntity entity) async {
    final userId = await appDb.userDao.saveUser(
      UsersCompanion(
        name: Value(entity.name),
        username: Value(entity.username),
        password: Value(entity.password),
      ),
    );

    await appDb.userDao.setLoggedIn(userId, value: true);
  }
}
