import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_verification_model.freezed.dart';
part 'account_verification_model.g.dart';

@freezed
class AccountVerificationModel with _$AccountVerificationModel {
  const factory AccountVerificationModel({
    required String status,
    required String message,
    required VerificationData data,
  }) = _AccountVerificationModel;

  factory AccountVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$AccountVerificationModelFromJson(json);
}

@freezed
class VerificationData with _$VerificationData {
  const factory VerificationData({
    required bool isAccountModeVerified,
    required String accountMode,
    required String shopCategory,
  }) = _VerificationData;

  factory VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);
}
