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
  bool get verified => throw _privateConstructorUsedError;
  String get shopeName => throw _privateConstructorUsedError;
  String get cnic => throw _privateConstructorUsedError;
  String get shopeAddress => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  String? get blockReason => throw _privateConstructorUsedError;
  List<String> get blockedCnic => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  DateTime? get verificationDate => throw _privateConstructorUsedError;
  bool get verificationDocuments => throw _privateConstructorUsedError;
  String? get googleId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

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
      bool verified,
      String shopeName,
      String cnic,
      String shopeAddress,
      String role,
      bool isBlocked,
      String? blockReason,
      List<String> blockedCnic,
      String username,
      String country,
      String city,
      String phone,
      DateTime? verificationDate,
      bool verificationDocuments,
      String? googleId,
      String createdAt,
      String updatedAt});
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
    Object? verified = null,
    Object? shopeName = null,
    Object? cnic = null,
    Object? shopeAddress = null,
    Object? role = null,
    Object? isBlocked = null,
    Object? blockReason = freezed,
    Object? blockedCnic = null,
    Object? username = null,
    Object? country = null,
    Object? city = null,
    Object? phone = null,
    Object? verificationDate = freezed,
    Object? verificationDocuments = null,
    Object? googleId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      shopeName: null == shopeName
          ? _value.shopeName
          : shopeName // ignore: cast_nullable_to_non_nullable
              as String,
      cnic: null == cnic
          ? _value.cnic
          : cnic // ignore: cast_nullable_to_non_nullable
              as String,
      shopeAddress: null == shopeAddress
          ? _value.shopeAddress
          : shopeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
      blockedCnic: null == blockedCnic
          ? _value.blockedCnic
          : blockedCnic // ignore: cast_nullable_to_non_nullable
              as List<String>,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      googleId: freezed == googleId
          ? _value.googleId
          : googleId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      bool verified,
      String shopeName,
      String cnic,
      String shopeAddress,
      String role,
      bool isBlocked,
      String? blockReason,
      List<String> blockedCnic,
      String username,
      String country,
      String city,
      String phone,
      DateTime? verificationDate,
      bool verificationDocuments,
      String? googleId,
      String createdAt,
      String updatedAt});
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
    Object? verified = null,
    Object? shopeName = null,
    Object? cnic = null,
    Object? shopeAddress = null,
    Object? role = null,
    Object? isBlocked = null,
    Object? blockReason = freezed,
    Object? blockedCnic = null,
    Object? username = null,
    Object? country = null,
    Object? city = null,
    Object? phone = null,
    Object? verificationDate = freezed,
    Object? verificationDocuments = null,
    Object? googleId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      shopeName: null == shopeName
          ? _value.shopeName
          : shopeName // ignore: cast_nullable_to_non_nullable
              as String,
      cnic: null == cnic
          ? _value.cnic
          : cnic // ignore: cast_nullable_to_non_nullable
              as String,
      shopeAddress: null == shopeAddress
          ? _value.shopeAddress
          : shopeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
      blockedCnic: null == blockedCnic
          ? _value._blockedCnic
          : blockedCnic // ignore: cast_nullable_to_non_nullable
              as List<String>,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      googleId: freezed == googleId
          ? _value.googleId
          : googleId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.verified = false,
      this.shopeName = '',
      this.cnic = '',
      this.shopeAddress = '',
      this.role = '',
      this.isBlocked = false,
      this.blockReason = null,
      final List<String> blockedCnic = const [],
      this.username = '',
      this.country = '',
      this.city = '',
      this.phone = '',
      this.verificationDate = null,
      this.verificationDocuments = false,
      this.googleId = null,
      this.createdAt = '',
      this.updatedAt = ''})
      : _blockedCnic = blockedCnic;

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
  final bool verified;
  @override
  @JsonKey()
  final String shopeName;
  @override
  @JsonKey()
  final String cnic;
  @override
  @JsonKey()
  final String shopeAddress;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final bool isBlocked;
  @override
  @JsonKey()
  final String? blockReason;
  final List<String> _blockedCnic;
  @override
  @JsonKey()
  List<String> get blockedCnic {
    if (_blockedCnic is EqualUnmodifiableListView) return _blockedCnic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedCnic);
  }

  @override
  @JsonKey()
  final String username;
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
  final String? googleId;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;

  @override
  String toString() {
    return 'User(id: $id, fullname: $fullname, email: $email, password: $password, accountMode: $accountMode, shopCategory: $shopCategory, otp: $otp, otpExpiry: $otpExpiry, verified: $verified, shopeName: $shopeName, cnic: $cnic, shopeAddress: $shopeAddress, role: $role, isBlocked: $isBlocked, blockReason: $blockReason, blockedCnic: $blockedCnic, username: $username, country: $country, city: $city, phone: $phone, verificationDate: $verificationDate, verificationDocuments: $verificationDocuments, googleId: $googleId, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.shopeName, shopeName) ||
                other.shopeName == shopeName) &&
            (identical(other.cnic, cnic) || other.cnic == cnic) &&
            (identical(other.shopeAddress, shopeAddress) ||
                other.shopeAddress == shopeAddress) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason) &&
            const DeepCollectionEquality()
                .equals(other._blockedCnic, _blockedCnic) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.verificationDate, verificationDate) ||
                other.verificationDate == verificationDate) &&
            (identical(other.verificationDocuments, verificationDocuments) ||
                other.verificationDocuments == verificationDocuments) &&
            (identical(other.googleId, googleId) ||
                other.googleId == googleId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
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
        verified,
        shopeName,
        cnic,
        shopeAddress,
        role,
        isBlocked,
        blockReason,
        const DeepCollectionEquality().hash(_blockedCnic),
        username,
        country,
        city,
        phone,
        verificationDate,
        verificationDocuments,
        googleId,
        createdAt,
        updatedAt
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
      final bool verified,
      final String shopeName,
      final String cnic,
      final String shopeAddress,
      final String role,
      final bool isBlocked,
      final String? blockReason,
      final List<String> blockedCnic,
      final String username,
      final String country,
      final String city,
      final String phone,
      final DateTime? verificationDate,
      final bool verificationDocuments,
      final String? googleId,
      final String createdAt,
      final String updatedAt}) = _$UserImpl;

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
  bool get verified;
  @override
  String get shopeName;
  @override
  String get cnic;
  @override
  String get shopeAddress;
  @override
  String get role;
  @override
  bool get isBlocked;
  @override
  String? get blockReason;
  @override
  List<String> get blockedCnic;
  @override
  String get username;
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
  String? get googleId;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
