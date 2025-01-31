import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_verification_model.freezed.dart';
part 'account_verification_model.g.dart';

@freezed
class AccountVerificationModel with _$AccountVerificationModel {
  factory AccountVerificationModel({
    @Default('') String status,
    @Default('') String message,
    VerificationData? data,
  }) = _AccountVerificationModel;

  factory AccountVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$AccountVerificationModelFromJson(json);
}

@freezed
class VerificationData with _$VerificationData {
  factory VerificationData({
    @Default(false) bool isAccountModeVerified,
    @Default('') String accountMode,
    @Default('') String shopCategory,
  }) = _VerificationData;

  factory VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);
}
