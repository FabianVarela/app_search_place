import 'package:my_app/src/features/home/data/service/place_service.dart';
import 'package:my_app/src/features/home/domain/entity/place_entity.dart';

class PlaceRepository {
  PlaceRepository(this._placeService);

  late final PlaceService _placeService;

  Future<List<PlaceEntity>> getPlaces(String address) async {
    final model = await _placeService.getPlaces(address);
    if (model == null) return [];

    return [
      for (final item in model.results)
        PlaceEntity(
          id: item.placeId,
          name: item.name,
          icon: item.icon,
          rating: item.rating,
          lat: item.geometry.location.lat,
          lng: item.geometry.location.lng,
        ),
    ];
  }
}
