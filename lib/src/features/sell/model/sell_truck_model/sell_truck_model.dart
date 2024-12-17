import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_truck_model.freezed.dart';
part 'sell_truck_model.g.dart';

@freezed
class SellTruckModel with _$SellTruckModel {
  const factory SellTruckModel({
    @Default([]) List<String> truckImages, // Uploaded images
    @Default('') String truckVideo, // Uploaded video file path
    @Default('') String price, // Location
    @Default('') String location, // Location
    @Default('') String category, // Truck category
    @Default('') String registeredIn, // Registration area
    @Default('') String truckYear, // Year of the truck
    @Default('') String truckMake, // Make of the truck
    @Default('') String truckModel, // Model of the truck
    @Default('') String color, // Selected color
    @Default('') String engineType, // Engine type
    @Default('') String engineCapacity, // Engine capacity
    @Default('') String engineMileage, // Engine mileage
    @Default('') String description, // Description of the truck
    @Default('') String transmissionType, // Manual or automatic
    @Default([]) List<String> selectedFeatures, // Truck features
    @Default('') String sellerName, // Seller name
    @Default('') String mobileNumber, // Mobile number
    @Default('') String address, // Seller address
    @Default('') String comments, // Additional comments
    @Default(false) bool allowWhatsappContact, // Allow WhatsApp contact
  }) = _SellTruckModel;

  factory SellTruckModel.fromJson(Map<String, dynamic> json) =>
      _$SellTruckModelFromJson(json);
}
