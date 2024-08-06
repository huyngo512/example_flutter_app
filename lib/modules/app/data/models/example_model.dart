import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_model.g.dart';

@JsonSerializable()
class ExampleModel extends Equatable {
  final int id;
  final String image;
  final String title;
  final String? description;
  final String? url;
  final int order;
  final int status;
  final String createdAt;
  final String updatedAt;

  const ExampleModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.url,
      required this.order,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        image,
        title,
        description,
        url,
        order,
        status,
        createdAt,
        updatedAt,
      ];

  // Responsible for creating a instance from the json.
  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  // Responsible for converting the map to json.
  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);
}
