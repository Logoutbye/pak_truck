import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_truck_model.freezed.dart';
part 'sell_truck_model.g.dart';

@freezed
class SellTruckModel with _$SellTruckModel {
  const factory SellTruckModel({
    @Default([]) List<String> truckImages, // Uploaded images
    @Default([]) List<String> truckVideos, // Uploaded videos
    @Default('') String price, // Price
    @Default('') String location, // Location
    @Default('') String category, // Main category (Truck, Bus, etc.)
    @Default('') String subCategory, // Subcategory
    @Default('') String registeredIn, // Registration area
    @Default('') String modelYear, // Year of the truck
    @Default('') String make, // Make of the truck
    @Default('') String truckModel, // Model of the truck
    @Default('') String color, // Selected color
    @Default('') String engineType, // Engine type (diesel, petrol, etc.)
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
    @Default('') String localOrImported, // Local or imported
    @Default('Vehicle') String adType, // Default to "Vehicle"
    @Default('') String postedBy, // User ID who posted the ad
    @Default('') String createdAt, // Date of posting (set from backend)
  }) = _SellTruckModel;

  factory SellTruckModel.fromJson(Map<String, dynamic> json) =>
      _$SellTruckModelFromJson(json);
}
