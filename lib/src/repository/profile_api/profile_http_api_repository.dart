import 'package:testt/src/model/user/user_model.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../data/network/app_url.dart';
import 'profile_repository.dart';

class ProfileHttpApiRepository implements ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<UserModel> fetchMyProfile() async {
    try {
      final response = await _apiServices.fetchGetApiResponse(AppUrl.myprofile);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
