import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app/src/features/home/data/model/location_model.dart';

part 'geometry_model.g.dart';

@JsonSerializable(createToJson: false)
class GeometryModel extends Equatable {
  const GeometryModel({required this.location});

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);

  final LocationModel location;

  @override
  List<Object?> get props => [location];
}
