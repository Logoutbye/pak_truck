// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      token: json['token'] as String? ?? '',
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'success': instance.success,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String? ?? '',
      fullname: json['fullname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      accountMode: json['accountMode'] as String? ?? '',
      shopCategory: json['shopCategory'] as String? ?? '',
      otp: json['otp'] as String? ?? '',
      otpExpiry: json['otpExpiry'] == null
          ? null
          : DateTime.parse(json['otpExpiry'] as String),
      verified: json['verified'] as bool? ?? false,
      shopeName: json['shopeName'] as String? ?? '',
      cnic: json['cnic'] as String? ?? '',
      shopeAddress: json['shopeAddress'] as String? ?? '',
      role: json['role'] as String? ?? '',
      isBlocked: json['isBlocked'] as bool? ?? false,
      blockReason: json['blockReason'] as String? ?? null,
      blockedCnic: (json['blockedCnic'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      username: json['username'] as String? ?? '',
      country: json['country'] as String? ?? '',
      city: json['city'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      verificationDate: json['verificationDate'] == null
          ? null
          : DateTime.parse(json['verificationDate'] as String),
      verificationDocuments: json['verificationDocuments'] as bool? ?? false,
      googleId: json['googleId'] as String? ?? null,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'password': instance.password,
      'accountMode': instance.accountMode,
      'shopCategory': instance.shopCategory,
      'otp': instance.otp,
      'otpExpiry': instance.otpExpiry?.toIso8601String(),
      'verified': instance.verified,
      'shopeName': instance.shopeName,
      'cnic': instance.cnic,
      'shopeAddress': instance.shopeAddress,
      'role': instance.role,
      'isBlocked': instance.isBlocked,
      'blockReason': instance.blockReason,
      'blockedCnic': instance.blockedCnic,
      'username': instance.username,
      'country': instance.country,
      'city': instance.city,
      'phone': instance.phone,
      'verificationDate': instance.verificationDate?.toIso8601String(),
      'verificationDocuments': instance.verificationDocuments,
      'googleId': instance.googleId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
