import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:my_app/src/core/database/database.dart';
import 'package:my_app/src/features/home/data/service/place_service.dart';
import 'package:my_app/src/features/home/domain/repository/place_repository.dart';
import 'package:my_app/src/features/login/domain/repository/login_repository.dart';
import 'package:my_app/src/features/login/presentation/state/login_state.dart';
import 'package:my_app/src/features/login/presentation/state/login_view_model.dart';
import 'package:my_app/src/features/register/domain/repository/register_repository.dart';
import 'package:my_app/src/features/register/presentation/state/register_state.dart';
import 'package:my_app/src/features/register/presentation/state/register_view_model.dart';

// Database

final appDatabase = Provider((ref) => AppDatabase());

// Service

final placeService = Provider((ref) {
  const apiKey = '';
  return PlaceService('maps.googleapis.com', apiKey, Client());
});

// Repository

final loginRepository = Provider(
  (ref) => LoginRepository(appDb: ref.watch(appDatabase)),
);

final registerRepository = Provider(
  (ref) => RegisterRepository(appDb: ref.watch(appDatabase)),
);

final placeRepository = Provider(
  (ref) => PlaceRepository(ref.watch(placeService)),
);

// ViewModel

final loginVieModel = StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(ref.watch(loginRepository)),
);

final registerViewModel =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
  (ref) => RegisterViewModel(ref.watch(registerRepository)),
);
