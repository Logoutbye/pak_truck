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
}



// /// phone number
// router.post("/send-phone-otp", authController.sendOTP);

// router.post("/verify-phone-otp", authController.verifyOTP);

// router.post("/select-account-mode", authController.selectAccountMode);


// router.post("/sign-up-email", authController.signupUser);

// router.post("/send-email-otp", authController.sendEmailOtp);

// router.post("/sign-up-email-web", authController.signupUserWeb);


// router.post("/signInEmail", authController.signin);


// router.post('/app/forgot-password', authController.forgotPassword);

// router.post('/app/reset-password', authController.resetPassword);
