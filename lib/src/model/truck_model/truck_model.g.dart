// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truck_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TruckModelImpl _$$TruckModelImplFromJson(Map<String, dynamic> json) =>
    _$TruckModelImpl(
      truckImages: (json['truckImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      truckVideos: (json['truckVideos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      price: (json['price'] as num?)?.toInt() ?? 0,
      modelYear: (json['modelYear'] as num?)?.toInt() ?? 0,
      location: json['location'] as String? ?? '',
      category: json['category'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      registeredIn: json['registeredIn'] as String? ?? '',
      make: json['make'] as String? ?? '',
      truckModel: json['truckModel'] as String? ?? '',
      color: json['color'] as String? ?? '',
      engineType: json['engineType'] as String? ?? '',
      engineCapacity: json['engineCapacity'] as String? ?? '',
      engineMileage: json['engineMileage'] as String? ?? '',
      description: json['description'] as String? ?? '',
      transmissionType: json['transmissionType'] as String? ?? '',
      selectedFeatures: (json['selectedFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sellerName: json['sellerName'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      address: json['address'] as String? ?? '',
      comments: json['comments'] as String? ?? '',
      allowWhatsappContact: json['allowWhatsappContact'] as bool? ?? false,
      localOrImported: json['localOrImported'] as String? ?? '',
      adType: json['adType'] as String? ?? 'Vehicle',
      postedBy: json['postedBy'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$TruckModelImplToJson(_$TruckModelImpl instance) =>
    <String, dynamic>{
      'truckImages': instance.truckImages,
      'truckVideos': instance.truckVideos,
      'price': instance.price,
      'modelYear': instance.modelYear,
      'location': instance.location,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'registeredIn': instance.registeredIn,
      'make': instance.make,
      'truckModel': instance.truckModel,
      'color': instance.color,
      'engineType': instance.engineType,
      'engineCapacity': instance.engineCapacity,
      'engineMileage': instance.engineMileage,
      'description': instance.description,
      'transmissionType': instance.transmissionType,
      'selectedFeatures': instance.selectedFeatures,
      'sellerName': instance.sellerName,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'comments': instance.comments,
      'allowWhatsappContact': instance.allowWhatsappContact,
      'localOrImported': instance.localOrImported,
      'adType': instance.adType,
      'postedBy': instance.postedBy,
      'createdAt': instance.createdAt,
    };
