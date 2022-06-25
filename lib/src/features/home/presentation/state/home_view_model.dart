import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/src/core/dependency/dependencies.dart';
import 'package:my_app/src/features/home/domain/entity/place_entity.dart';

final searchText = StateProvider((ref) => '');

final placeListFilter = FutureProvider((ref) async {
  final search = ref.watch(searchText);
  if (search.isEmpty) return <PlaceEntity>[];
  return ref.watch(placeListData(search).future);
});

final placeListData = FutureProvider.family((ref, String address) async {
  return ref.watch(placeRepository).getPlaces(address);
});
