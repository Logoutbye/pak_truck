class AppUrl {
  // static const baseUrl = "http://192.168.18.132:8000/api"; //local
  static const baseUrl = "http://44.211.61.175/api"; // live

  static var sendPhoneOtp = '$baseUrl/auth/send-phone-otp'; // done
  static var verifyPhoneOtp = '$baseUrl/auth/verify-phone-otp'; // done
  static var reSendPhoneOtp = '$baseUrl/auth/otp/send';

  static var signupEmail = '$baseUrl/auth/sign-up-email';
  static var signInEmail = '$baseUrl/auth/signInEmail';

  static var selectAccountMode = '$baseUrl/auth/select-account-mode';
  static var completeProfile = '$baseUrl/auth/send-otp';
  static var forgetPassword = '$baseUrl/auth/forgot-password';
  static var resetPassword = '$baseUrl/auth/reset-password';

  static var myprofile = '$baseUrl/profile/';
  static var editprofile = '$baseUrl/profile/edit-profile';
  static var checkVerification = '$baseUrl/profile/check-verification';
  static var verifyIndividualAccount = '$baseUrl/profile/verify-individual-account';
  static var verifyShopAccount = '$baseUrl/profile/verify-shop-account';
  static var markFavorite = '$baseUrl/profile/favorites/mark';
  static var unmarkFavorite = '$baseUrl/profile/favorites/unmark';
  static var myFavorite = '$baseUrl/profile/favorites/';
}


// router.get('/', protect, profileController.getProfile);
// router.patch('/edit-profile', protect, upload.single('profileImage'), profileController.editProfile);
// router.get('/check-verification', protect, profileController.checkAccountModeVerification);

// // API route for verifying individual account
// router.post('/verify-individual-account', protect, upload.fields([
//     { name: 'idCardFrontImage', maxCount: 1 },
//     { name: 'idCardBackImage', maxCount: 1 }
// ]), profileController.verifyIndividualAccount);

// router.post('/verify-shop-account', protect, upload.fields([
//     { name: 'idCardFrontImage', maxCount: 1 },
//     { name: 'idCardBackImage', maxCount: 1 },
//     { name: 'shopImage', maxCount: 1 }
// ]), profileController.verifyShopAccount);


// router.post('/favorites/mark', protect, profileController.markFavorite);
// router.delete('/favorites/unmark', protect, profileController.unmarkFavorite);
// router.get('/favorites', protect, profileController.getFavorites);