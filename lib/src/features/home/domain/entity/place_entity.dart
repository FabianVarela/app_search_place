import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  const PlaceEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.rating,
    required this.lat,
    required this.lng,
  });

  final String id;
  final String name;
  final String icon;
  final num rating;
  final double lat;
  final double lng;

  @override
  List<Object?> get props => [id, name, icon, rating, lat, lng];
}
