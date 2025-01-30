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
      otpVerification: json['otpVerification'] as bool? ?? false,
      shopName: json['shopName'] as String? ?? '',
      shopAddress: json['shopAddress'] as String? ?? '',
      role: json['role'] as String? ?? '',
      country: json['country'] as String? ?? '',
      city: json['city'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      verificationDate: json['verificationDate'] == null
          ? null
          : DateTime.parse(json['verificationDate'] as String),
      verificationDocuments: json['verificationDocuments'] as bool? ?? false,
      isAccountModeVerified: json['isAccountModeVerified'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? false,
      googleId: json['googleId'] as String? ?? null,
      profileImage: json['profileImage'] as String? ?? null,
      idCardFrontImage: json['idCardFrontImage'] as String? ?? null,
      idCardBackImage: json['idCardBackImage'] as String? ?? null,
      shopImage: json['shopImage'] as String? ?? null,
      passwordResetToken: json['passwordResetToken'] as String? ?? null,
      passwordResetExpires: json['passwordResetExpires'] == null
          ? null
          : DateTime.parse(json['passwordResetExpires'] as String),
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => FavoriteItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'otpVerification': instance.otpVerification,
      'shopName': instance.shopName,
      'shopAddress': instance.shopAddress,
      'role': instance.role,
      'country': instance.country,
      'city': instance.city,
      'phone': instance.phone,
      'verificationDate': instance.verificationDate?.toIso8601String(),
      'verificationDocuments': instance.verificationDocuments,
      'isAccountModeVerified': instance.isAccountModeVerified,
      'isActive': instance.isActive,
      'googleId': instance.googleId,
      'profileImage': instance.profileImage,
      'idCardFrontImage': instance.idCardFrontImage,
      'idCardBackImage': instance.idCardBackImage,
      'shopImage': instance.shopImage,
      'passwordResetToken': instance.passwordResetToken,
      'passwordResetExpires': instance.passwordResetExpires?.toIso8601String(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'favorites': instance.favorites,
    };

_$FavoriteItemImpl _$$FavoriteItemImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteItemImpl(
      itemId: json['itemId'] as String? ?? '',
      itemType: json['itemType'] as String? ?? '',
    );

Map<String, dynamic> _$$FavoriteItemImplToJson(_$FavoriteItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemType': instance.itemType,
    };
