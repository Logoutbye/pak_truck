// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountVerificationModelImpl _$$AccountVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountVerificationModelImpl(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : VerificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountVerificationModelImplToJson(
        _$AccountVerificationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$VerificationDataImpl _$$VerificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationDataImpl(
      isAccountModeVerified: json['isAccountModeVerified'] as bool? ?? false,
      accountMode: json['accountMode'] as String? ?? '',
      shopCategory: json['shopCategory'] as String? ?? '',
    );

Map<String, dynamic> _$$VerificationDataImplToJson(
        _$VerificationDataImpl instance) =>
    <String, dynamic>{
      'isAccountModeVerified': instance.isAccountModeVerified,
      'accountMode': instance.accountMode,
      'shopCategory': instance.shopCategory,
    };
