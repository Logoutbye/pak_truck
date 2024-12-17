// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_parts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SparePartsModelImpl _$$SparePartsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SparePartsModelImpl(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      location: json['location'] as String? ?? '',
      price: json['price'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      sellerName: json['sellerName'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      address: json['address'] as String? ?? '',
      comments: json['comments'] as String? ?? '',
      allowWhatsappContact: json['allowWhatsappContact'] as bool? ?? false,
    );

Map<String, dynamic> _$$SparePartsModelImplToJson(
        _$SparePartsModelImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'location': instance.location,
      'price': instance.price,
      'title': instance.title,
      'description': instance.description,
      'sellerName': instance.sellerName,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'comments': instance.comments,
      'allowWhatsappContact': instance.allowWhatsappContact,
    };
