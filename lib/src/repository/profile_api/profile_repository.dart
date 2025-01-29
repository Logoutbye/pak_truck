
import 'package:testt/src/model/user/user_model.dart';

abstract class ProfileRepository {
  // Sign up with phone
  Future<UserModel> fetchMyProfile();


}
