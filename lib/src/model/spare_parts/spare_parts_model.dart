import 'package:freezed_annotation/freezed_annotation.dart';

part 'spare_parts_model.freezed.dart';
part 'spare_parts_model.g.dart';

@freezed
class SparePartsModel with _$SparePartsModel {
  const factory SparePartsModel({
   @Default([]) List<String>? images, // List of image file paths
   @Default('') String category, // Location
   @Default('') String location, // Location
   @Default('') String price, // Location
   @Default('') String title, // Title
   @Default('') String description, // Description
   @Default('') String sellerName, // Seller name
   @Default('') String mobileNumber, // Mobile number
   @Default('') String address, // Address
   @Default('') String comments, // Optional comments
    @Default(false) bool allowWhatsappContact, // Allow WhatsApp contact
  }) = _SparePartsModel;

  factory SparePartsModel.fromJson(Map<String, dynamic> json) =>
      _$SparePartsModelFromJson(json);
}
