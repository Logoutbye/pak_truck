// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get token => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({String token, User? user, bool success});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = freezed,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, User? user, bool success});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = freezed,
    Object? success = null,
  }) {
    return _then(_$UserModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl({this.token = '', this.user, this.success = false});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String token;
  @override
  final User? user;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'UserModel(token: $token, user: $user, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user, success);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String token,
      final User? user,
      final bool success}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get token;
  @override
  User? get user;
  @override
  bool get success;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get accountMode => throw _privateConstructorUsedError;
  String get shopCategory => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  DateTime? get otpExpiry => throw _privateConstructorUsedError;
  bool get otpVerification => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  String get shopAddress => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  DateTime? get verificationDate => throw _privateConstructorUsedError;
  bool get verificationDocuments => throw _privateConstructorUsedError;
  bool get isAccountModeVerified => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get googleId => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String? get idCardFrontImage => throw _privateConstructorUsedError;
  String? get idCardBackImage => throw _privateConstructorUsedError;
  String? get shopImage => throw _privateConstructorUsedError;
  String? get passwordResetToken => throw _privateConstructorUsedError;
  DateTime? get passwordResetExpires => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<FavoriteItem> get favorites => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String fullname,
      String email,
      String password,
      String accountMode,
      String shopCategory,
      String otp,
      DateTime? otpExpiry,
      bool otpVerification,
      String shopName,
      String shopAddress,
      String role,
      String country,
      String city,
      String phone,
      DateTime? verificationDate,
      bool verificationDocuments,
      bool isAccountModeVerified,
      bool isActive,
      String? googleId,
      String? profileImage,
      String? idCardFrontImage,
      String? idCardBackImage,
      String? shopImage,
      String? passwordResetToken,
      DateTime? passwordResetExpires,
      String createdAt,
      String updatedAt,
      List<FavoriteItem> favorites});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? email = null,
    Object? password = null,
    Object? accountMode = null,
    Object? shopCategory = null,
    Object? otp = null,
    Object? otpExpiry = freezed,
    Object? otpVerification = null,
    Object? shopName = null,
    Object? shopAddress = null,
    Object? role = null,
    Object? country = null,
    Object? city = null,
    Object? phone = null,
    Object? verificationDate = freezed,
    Object? verificationDocuments = null,
    Object? isAccountModeVerified = null,
    Object? isActive = null,
    Object? googleId = freezed,
    Object? profileImage = freezed,
    Object? idCardFrontImage = freezed,
    Object? idCardBackImage = freezed,
    Object? shopImage = freezed,
    Object? passwordResetToken = freezed,
    Object? passwordResetExpires = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? favorites = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accountMode: null == accountMode
          ? _value.accountMode
          : accountMode // ignore: cast_nullable_to_non_nullable
              as String,
      shopCategory: null == shopCategory
          ? _value.shopCategory
          : shopCategory // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      otpExpiry: freezed == otpExpiry
          ? _value.otpExpiry
          : otpExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      otpVerification: null == otpVerification
          ? _value.otpVerification
          : otpVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verificationDate: freezed == verificationDate
          ? _value.verificationDate
          : verificationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      verificationDocuments: null == verificationDocuments
          ? _value.verificationDocuments
          : verificationDocuments // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountModeVerified: null == isAccountModeVerified
          ? _value.isAccountModeVerified
          : isAccountModeVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      googleId: freezed == googleId
          ? _value.googleId
          : googleId // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      idCardFrontImage: freezed == idCardFrontImage
          ? _value.idCardFrontImage
          : idCardFrontImage // ignore: cast_nullable_to_non_nullable
              as String?,
      idCardBackImage: freezed == idCardBackImage
          ? _value.idCardBackImage
          : idCardBackImage // ignore: cast_nullable_to_non_nullable
              as String?,
      shopImage: freezed == shopImage
          ? _value.shopImage
          : shopImage // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordResetToken: freezed == passwordResetToken
          ? _value.passwordResetToken
          : passwordResetToken // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordResetExpires: freezed == passwordResetExpires
          ? _value.passwordResetExpires
          : passwordResetExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FavoriteItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String fullname,
      String email,
      String password,
      String accountMode,
      String shopCategory,
      String otp,
      DateTime? otpExpiry,
      bool otpVerification,
      String shopName,
      String shopAddress,
      String role,
      String country,
      String city,
      String phone,
      DateTime? verificationDate,
      bool verificationDocuments,
      bool isAccountModeVerified,
      bool isActive,
      String? googleId,
      String? profileImage,
      String? idCardFrontImage,
      String? idCardBackImage,
      String? shopImage,
      String? passwordResetToken,
      DateTime? passwordResetExpires,
      String createdAt,
      String updatedAt,
      List<FavoriteItem> favorites});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? email = null,
    Object? password = null,
    Object? accountMode = null,
    Object? shopCategory = null,
    Object? otp = null,
    Object? otpExpiry = freezed,
    Object? otpVerification = null,
    Object? shopName = null,
    Object? shopAddress = null,
    Object? role = null,
    Object? country = null,
    Object? city = null,
    Object? phone = null,
    Object? verificationDate = freezed,
    Object? verificationDocuments = null,
    Object? isAccountModeVerified = null,
    Object? isActive = null,
    Object? googleId = freezed,
    Object? profileImage = freezed,
    Object? idCardFrontImage = freezed,
    Object? idCardBackImage = freezed,
    Object? shopImage = freezed,
    Object? passwordResetToken = freezed,
    Object? passwordResetExpires = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? favorites = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accountMode: null == accountMode
          ? _value.accountMode
          : accountMode // ignore: cast_nullable_to_non_nullable
              as String,
      shopCategory: null == shopCategory
          ? _value.shopCategory
          : shopCategory // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      otpExpiry: freezed == otpExpiry
          ? _value.otpExpiry
          : otpExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      otpVerification: null == otpVerification
          ? _value.otpVerification
          : otpVerification // ignore: cast_nullable_to_non_nullable
              as bool,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      verificationDate: freezed == verificationDate
          ? _value.verificationDate
          : verificationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      verificationDocuments: null == verificationDocuments
          ? _value.verificationDocuments
          : verificationDocuments // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountModeVerified: null == isAccountModeVerified
          ? _value.isAccountModeVerified
          : isAccountModeVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      googleId: freezed == googleId
          ? _value.googleId
          : googleId // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      idCardFrontImage: freezed == idCardFrontImage
          ? _value.idCardFrontImage
          : idCardFrontImage // ignore: cast_nullable_to_non_nullable
              as String?,
      idCardBackImage: freezed == idCardBackImage
          ? _value.idCardBackImage
          : idCardBackImage // ignore: cast_nullable_to_non_nullable
              as String?,
      shopImage: freezed == shopImage
          ? _value.shopImage
          : shopImage // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordResetToken: freezed == passwordResetToken
          ? _value.passwordResetToken
          : passwordResetToken // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordResetExpires: freezed == passwordResetExpires
          ? _value.passwordResetExpires
          : passwordResetExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FavoriteItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  _$UserImpl(
      {@JsonKey(name: '_id') this.id = '',
      this.fullname = '',
      this.email = '',
      this.password = '',
      this.accountMode = '',
      this.shopCategory = '',
      this.otp = '',
      this.otpExpiry = null,
      this.otpVerification = false,
      this.shopName = '',
      this.shopAddress = '',
      this.role = '',
      this.country = '',
      this.city = '',
      this.phone = '',
      this.verificationDate = null,
      this.verificationDocuments = false,
      this.isAccountModeVerified = false,
      this.isActive = false,
      this.googleId = null,
      this.profileImage = null,
      this.idCardFrontImage = null,
      this.idCardBackImage = null,
      this.shopImage = null,
      this.passwordResetToken = null,
      this.passwordResetExpires = null,
      this.createdAt = '',
      this.updatedAt = '',
      final List<FavoriteItem> favorites = const []})
      : _favorites = favorites;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey()
  final String fullname;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String accountMode;
  @override
  @JsonKey()
  final String shopCategory;
  @override
  @JsonKey()
  final String otp;
  @override
  @JsonKey()
  final DateTime? otpExpiry;
  @override
  @JsonKey()
  final bool otpVerification;
  @override
  @JsonKey()
  final String shopName;
  @override
  @JsonKey()
  final String shopAddress;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final DateTime? verificationDate;
  @override
  @JsonKey()
  final bool verificationDocuments;
  @override
  @JsonKey()
  final bool isAccountModeVerified;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final String? googleId;
  @override
  @JsonKey()
  final String? profileImage;
  @override
  @JsonKey()
  final String? idCardFrontImage;
  @override
  @JsonKey()
  final String? idCardBackImage;
  @override
  @JsonKey()
  final String? shopImage;
  @override
  @JsonKey()
  final String? passwordResetToken;
  @override
  @JsonKey()
  final DateTime? passwordResetExpires;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;
  final List<FavoriteItem> _favorites;
  @override
  @JsonKey()
  List<FavoriteItem> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  String toString() {
    return 'User(id: $id, fullname: $fullname, email: $email, password: $password, accountMode: $accountMode, shopCategory: $shopCategory, otp: $otp, otpExpiry: $otpExpiry, otpVerification: $otpVerification, shopName: $shopName, shopAddress: $shopAddress, role: $role, country: $country, city: $city, phone: $phone, verificationDate: $verificationDate, verificationDocuments: $verificationDocuments, isAccountModeVerified: $isAccountModeVerified, isActive: $isActive, googleId: $googleId, profileImage: $profileImage, idCardFrontImage: $idCardFrontImage, idCardBackImage: $idCardBackImage, shopImage: $shopImage, passwordResetToken: $passwordResetToken, passwordResetExpires: $passwordResetExpires, createdAt: $createdAt, updatedAt: $updatedAt, favorites: $favorites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.accountMode, accountMode) ||
                other.accountMode == accountMode) &&
            (identical(other.shopCategory, shopCategory) ||
                other.shopCategory == shopCategory) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.otpExpiry, otpExpiry) ||
                other.otpExpiry == otpExpiry) &&
            (identical(other.otpVerification, otpVerification) ||
                other.otpVerification == otpVerification) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.verificationDate, verificationDate) ||
                other.verificationDate == verificationDate) &&
            (identical(other.verificationDocuments, verificationDocuments) ||
                other.verificationDocuments == verificationDocuments) &&
            (identical(other.isAccountModeVerified, isAccountModeVerified) ||
                other.isAccountModeVerified == isAccountModeVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.googleId, googleId) ||
                other.googleId == googleId) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.idCardFrontImage, idCardFrontImage) ||
                other.idCardFrontImage == idCardFrontImage) &&
            (identical(other.idCardBackImage, idCardBackImage) ||
                other.idCardBackImage == idCardBackImage) &&
            (identical(other.shopImage, shopImage) ||
                other.shopImage == shopImage) &&
            (identical(other.passwordResetToken, passwordResetToken) ||
                other.passwordResetToken == passwordResetToken) &&
            (identical(other.passwordResetExpires, passwordResetExpires) ||
                other.passwordResetExpires == passwordResetExpires) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        fullname,
        email,
        password,
        accountMode,
        shopCategory,
        otp,
        otpExpiry,
        otpVerification,
        shopName,
        shopAddress,
        role,
        country,
        city,
        phone,
        verificationDate,
        verificationDocuments,
        isAccountModeVerified,
        isActive,
        googleId,
        profileImage,
        idCardFrontImage,
        idCardBackImage,
        shopImage,
        passwordResetToken,
        passwordResetExpires,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_favorites)
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: '_id') final String id,
      final String fullname,
      final String email,
      final String password,
      final String accountMode,
      final String shopCategory,
      final String otp,
      final DateTime? otpExpiry,
      final bool otpVerification,
      final String shopName,
      final String shopAddress,
      final String role,
      final String country,
      final String city,
      final String phone,
      final DateTime? verificationDate,
      final bool verificationDocuments,
      final bool isAccountModeVerified,
      final bool isActive,
      final String? googleId,
      final String? profileImage,
      final String? idCardFrontImage,
      final String? idCardBackImage,
      final String? shopImage,
      final String? passwordResetToken,
      final DateTime? passwordResetExpires,
      final String createdAt,
      final String updatedAt,
      final List<FavoriteItem> favorites}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get fullname;
  @override
  String get email;
  @override
  String get password;
  @override
  String get accountMode;
  @override
  String get shopCategory;
  @override
  String get otp;
  @override
  DateTime? get otpExpiry;
  @override
  bool get otpVerification;
  @override
  String get shopName;
  @override
  String get shopAddress;
  @override
  String get role;
  @override
  String get country;
  @override
  String get city;
  @override
  String get phone;
  @override
  DateTime? get verificationDate;
  @override
  bool get verificationDocuments;
  @override
  bool get isAccountModeVerified;
  @override
  bool get isActive;
  @override
  String? get googleId;
  @override
  String? get profileImage;
  @override
  String? get idCardFrontImage;
  @override
  String? get idCardBackImage;
  @override
  String? get shopImage;
  @override
  String? get passwordResetToken;
  @override
  DateTime? get passwordResetExpires;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<FavoriteItem> get favorites;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) {
  return _FavoriteItem.fromJson(json);
}

/// @nodoc
mixin _$FavoriteItem {
  String get itemId => throw _privateConstructorUsedError;
  String get itemType => throw _privateConstructorUsedError;

  /// Serializes this FavoriteItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteItemCopyWith<FavoriteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteItemCopyWith<$Res> {
  factory $FavoriteItemCopyWith(
          FavoriteItem value, $Res Function(FavoriteItem) then) =
      _$FavoriteItemCopyWithImpl<$Res, FavoriteItem>;
  @useResult
  $Res call({String itemId, String itemType});
}

/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res, $Val extends FavoriteItem>
    implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemType = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteItemImplCopyWith<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  factory _$$FavoriteItemImplCopyWith(
          _$FavoriteItemImpl value, $Res Function(_$FavoriteItemImpl) then) =
      __$$FavoriteItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String itemId, String itemType});
}

/// @nodoc
class __$$FavoriteItemImplCopyWithImpl<$Res>
    extends _$FavoriteItemCopyWithImpl<$Res, _$FavoriteItemImpl>
    implements _$$FavoriteItemImplCopyWith<$Res> {
  __$$FavoriteItemImplCopyWithImpl(
      _$FavoriteItemImpl _value, $Res Function(_$FavoriteItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemType = null,
  }) {
    return _then(_$FavoriteItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteItemImpl implements _FavoriteItem {
  _$FavoriteItemImpl({this.itemId = '', this.itemType = ''});

  factory _$FavoriteItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteItemImplFromJson(json);

  @override
  @JsonKey()
  final String itemId;
  @override
  @JsonKey()
  final String itemType;

  @override
  String toString() {
    return 'FavoriteItem(itemId: $itemId, itemType: $itemType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, itemType);

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteItemImplCopyWith<_$FavoriteItemImpl> get copyWith =>
      __$$FavoriteItemImplCopyWithImpl<_$FavoriteItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteItemImplToJson(
      this,
    );
  }
}

abstract class _FavoriteItem implements FavoriteItem {
  factory _FavoriteItem({final String itemId, final String itemType}) =
      _$FavoriteItemImpl;

  factory _FavoriteItem.fromJson(Map<String, dynamic> json) =
      _$FavoriteItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemType;

  /// Create a copy of FavoriteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteItemImplCopyWith<_$FavoriteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
