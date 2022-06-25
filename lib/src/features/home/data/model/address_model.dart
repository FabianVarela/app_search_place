import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app/src/features/home/data/model/geometry_model.dart';

part 'address_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AddressModel extends Equatable {
  const AddressModel({
    required this.placeId,
    required this.name,
    required this.icon,
    required this.rating,
    required this.geometry,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  final String placeId;
  final String name;
  final String icon;
  final num rating;
  final GeometryModel geometry;

  @override
  List<Object?> get props => [placeId, name, icon, rating, geometry];
}
