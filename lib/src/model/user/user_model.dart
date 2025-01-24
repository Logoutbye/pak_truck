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
    @Default(false) bool verified,
    @Default('') String shopeName,
    @Default('') String cnic,
    @Default('') String shopeAddress,
    @Default('') String role,
    @Default(false) bool isBlocked,
    @Default(null) String? blockReason,
    @Default([]) List<String> blockedCnic,
    @Default('') String username,
    @Default('') String country,
    @Default('') String city,
    @Default('') String phone,
    @Default(null) DateTime? verificationDate,
    @Default(false) bool verificationDocuments,
    @Default(null) String? googleId,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
