import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default('') String token,
    User? user,
    @Default(false) bool success,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: '_id') @Default('') String id,
    @Default('') String fullname,
    @Default('') String email,
    @Default('') String password,
    @Default('') String accountMode,
    @Default('') String shopCategory,
    @Default('') String otp,
    @Default(null) DateTime? otpExpiry,
    @Default(false) bool otpVerification,
    @Default('') String shopName,
    @Default('') String shopAddress,
    @Default('') String role,
    @Default('') String country,
    @Default('') String city,
    @Default('') String phone,
    @Default(null) DateTime? verificationDate,
    @Default(false) bool verificationDocuments,
    @Default(false) bool isAccountModeVerified,
    @Default(false) bool isActive,
    @Default(null) String? googleId,
    @Default(null) String? profileImage,
    @Default(null) String? idCardFrontImage,
    @Default(null) String? idCardBackImage,
    @Default(null) String? shopImage,
    @Default(null) String? passwordResetToken,
    @Default(null) DateTime? passwordResetExpires,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default([]) List<FavoriteItem> favorites,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class FavoriteItem with _$FavoriteItem {
  factory FavoriteItem({
    @Default('') String itemId,
    @Default('') String itemType,
  }) = _FavoriteItem;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);
}
