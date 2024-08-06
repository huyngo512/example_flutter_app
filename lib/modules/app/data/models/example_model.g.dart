// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleModel _$ExampleModelFromJson(Map<String, dynamic> json) => ExampleModel(
      id: json['id'] as int,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String?,
      order: json['order'] as int,
      status: json['status'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$ExampleModelToJson(ExampleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'order': instance.order,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
