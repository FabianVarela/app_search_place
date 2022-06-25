import 'package:my_app/src/core/database/database.dart';
import 'package:my_app/src/features/login/domain/entity/login_entity.dart';
import 'package:my_app/src/features/login/domain/entity/user_entity.dart';

class LoginRepository {
  LoginRepository({required this.appDb});

  late final AppDatabase appDb;

  Future<UserEntity?> loginUser(LoginEntity entity) async {
    final userTable = await appDb.userDao.getUser(
      entity.username,
      entity.password,
    );

    if (userTable == null) return null;

    await appDb.userDao.setLoggedIn(userTable.id, value: true);
    return UserEntity(
      id: userTable.id,
      name: userTable.name,
      username: userTable.username,
      password: userTable.password,
      isLoggedIn: userTable.isLoggedIn,
    );
  }
}
