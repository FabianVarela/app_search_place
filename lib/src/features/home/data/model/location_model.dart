import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(createToJson: false)
class LocationModel extends Equatable {
  const LocationModel({required this.lat, required this.lng});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  final double lat;
  final double lng;

  @override
  List<Object?> get props => [lat, lng];
}
