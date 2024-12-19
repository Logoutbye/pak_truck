import 'dart:convert';

import 'package:testt/src/features/auth/signup/model/send_email_otp.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../configs/app_url.dart';
import 'login_repository.dart';

class SignUpHttpApiRepository implements AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();
}
