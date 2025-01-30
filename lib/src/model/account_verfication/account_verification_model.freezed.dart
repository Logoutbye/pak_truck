// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountVerificationModel _$AccountVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _AccountVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$AccountVerificationModel {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  VerificationData get data => throw _privateConstructorUsedError;

  /// Serializes this AccountVerificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountVerificationModelCopyWith<AccountVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountVerificationModelCopyWith<$Res> {
  factory $AccountVerificationModelCopyWith(AccountVerificationModel value,
          $Res Function(AccountVerificationModel) then) =
      _$AccountVerificationModelCopyWithImpl<$Res, AccountVerificationModel>;
  @useResult
  $Res call({String status, String message, VerificationData data});

  $VerificationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$AccountVerificationModelCopyWithImpl<$Res,
        $Val extends AccountVerificationModel>
    implements $AccountVerificationModelCopyWith<$Res> {
  _$AccountVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VerificationData,
    ) as $Val);
  }

  /// Create a copy of AccountVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationDataCopyWith<$Res> get data {
    return $VerificationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountVerificationModelImplCopyWith<$Res>
    implements $AccountVerificationModelCopyWith<$Res> {
  factory _$$AccountVerificationModelImplCopyWith(
          _$AccountVerificationModelImpl value,
          $Res Function(_$AccountVerificationModelImpl) then) =
      __$$AccountVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, VerificationData data});

  @override
  $VerificationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AccountVerificationModelImplCopyWithImpl<$Res>
    extends _$AccountVerificationModelCopyWithImpl<$Res,
        _$AccountVerificationModelImpl>
    implements _$$AccountVerificationModelImplCopyWith<$Res> {
  __$$AccountVerificationModelImplCopyWithImpl(
      _$AccountVerificationModelImpl _value,
      $Res Function(_$AccountVerificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AccountVerificationModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VerificationData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountVerificationModelImpl implements _AccountVerificationModel {
  const _$AccountVerificationModelImpl(
      {required this.status, required this.message, required this.data});

  factory _$AccountVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountVerificationModelImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final VerificationData data;

  @override
  String toString() {
    return 'AccountVerificationModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountVerificationModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of AccountVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountVerificationModelImplCopyWith<_$AccountVerificationModelImpl>
      get copyWith => __$$AccountVerificationModelImplCopyWithImpl<
          _$AccountVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _AccountVerificationModel implements AccountVerificationModel {
  const factory _AccountVerificationModel(
      {required final String status,
      required final String message,
      required final VerificationData data}) = _$AccountVerificationModelImpl;

  factory _AccountVerificationModel.fromJson(Map<String, dynamic> json) =
      _$AccountVerificationModelImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  VerificationData get data;

  /// Create a copy of AccountVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountVerificationModelImplCopyWith<_$AccountVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerificationData _$VerificationDataFromJson(Map<String, dynamic> json) {
  return _VerificationData.fromJson(json);
}

/// @nodoc
mixin _$VerificationData {
  bool get isAccountModeVerified => throw _privateConstructorUsedError;
  String get accountMode => throw _privateConstructorUsedError;
  String get shopCategory => throw _privateConstructorUsedError;

  /// Serializes this VerificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationDataCopyWith<VerificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationDataCopyWith<$Res> {
  factory $VerificationDataCopyWith(
          VerificationData value, $Res Function(VerificationData) then) =
      _$VerificationDataCopyWithImpl<$Res, VerificationData>;
  @useResult
  $Res call(
      {bool isAccountModeVerified, String accountMode, String shopCategory});
}

/// @nodoc
class _$VerificationDataCopyWithImpl<$Res, $Val extends VerificationData>
    implements $VerificationDataCopyWith<$Res> {
  _$VerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAccountModeVerified = null,
    Object? accountMode = null,
    Object? shopCategory = null,
  }) {
    return _then(_value.copyWith(
      isAccountModeVerified: null == isAccountModeVerified
          ? _value.isAccountModeVerified
          : isAccountModeVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      accountMode: null == accountMode
          ? _value.accountMode
          : accountMode // ignore: cast_nullable_to_non_nullable
              as String,
      shopCategory: null == shopCategory
          ? _value.shopCategory
          : shopCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationDataImplCopyWith<$Res>
    implements $VerificationDataCopyWith<$Res> {
  factory _$$VerificationDataImplCopyWith(_$VerificationDataImpl value,
          $Res Function(_$VerificationDataImpl) then) =
      __$$VerificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAccountModeVerified, String accountMode, String shopCategory});
}

/// @nodoc
class __$$VerificationDataImplCopyWithImpl<$Res>
    extends _$VerificationDataCopyWithImpl<$Res, _$VerificationDataImpl>
    implements _$$VerificationDataImplCopyWith<$Res> {
  __$$VerificationDataImplCopyWithImpl(_$VerificationDataImpl _value,
      $Res Function(_$VerificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAccountModeVerified = null,
    Object? accountMode = null,
    Object? shopCategory = null,
  }) {
    return _then(_$VerificationDataImpl(
      isAccountModeVerified: null == isAccountModeVerified
          ? _value.isAccountModeVerified
          : isAccountModeVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      accountMode: null == accountMode
          ? _value.accountMode
          : accountMode // ignore: cast_nullable_to_non_nullable
              as String,
      shopCategory: null == shopCategory
          ? _value.shopCategory
          : shopCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationDataImpl implements _VerificationData {
  const _$VerificationDataImpl(
      {required this.isAccountModeVerified,
      required this.accountMode,
      required this.shopCategory});

  factory _$VerificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationDataImplFromJson(json);

  @override
  final bool isAccountModeVerified;
  @override
  final String accountMode;
  @override
  final String shopCategory;

  @override
  String toString() {
    return 'VerificationData(isAccountModeVerified: $isAccountModeVerified, accountMode: $accountMode, shopCategory: $shopCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationDataImpl &&
            (identical(other.isAccountModeVerified, isAccountModeVerified) ||
                other.isAccountModeVerified == isAccountModeVerified) &&
            (identical(other.accountMode, accountMode) ||
                other.accountMode == accountMode) &&
            (identical(other.shopCategory, shopCategory) ||
                other.shopCategory == shopCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isAccountModeVerified, accountMode, shopCategory);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationDataImplCopyWith<_$VerificationDataImpl> get copyWith =>
      __$$VerificationDataImplCopyWithImpl<_$VerificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationDataImplToJson(
      this,
    );
  }
}

abstract class _VerificationData implements VerificationData {
  const factory _VerificationData(
      {required final bool isAccountModeVerified,
      required final String accountMode,
      required final String shopCategory}) = _$VerificationDataImpl;

  factory _VerificationData.fromJson(Map<String, dynamic> json) =
      _$VerificationDataImpl.fromJson;

  @override
  bool get isAccountModeVerified;
  @override
  String get accountMode;
  @override
  String get shopCategory;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationDataImplCopyWith<_$VerificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
