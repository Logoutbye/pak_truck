import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:video_player/video_player.dart';

class SellViewModel extends ChangeNotifier {
  String _choosePlan = '';
  String get choosePlan => _choosePlan;

  void setPlan(String plan) {
    _choosePlan = plan;
    notifyListeners();
  }

//------------------------ vdeo picking/playing/removing mechanism starts from here------------------------

  File? _video;
  VideoPlayerController? _videoController;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  File? get video => _video;
  VideoPlayerController? get videoController => _videoController;

  void setVideo(File videoFile) {
    _video = videoFile;
    _videoController?.dispose();
    _videoController = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
        notifyListeners();
      });
    _isPlaying = false;
    notifyListeners();
  }

  void playVideo() {
    _videoController?.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseVideo() {
    _videoController?.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void stopVideo() {
    _videoController?.pause();
    _videoController?.seekTo(Duration.zero);
    _isPlaying = false;
    notifyListeners();
  }

  void removeVideo() {
    _video = null;
    _videoController?.dispose();
    _videoController = null;
    _isPlaying = false;
    notifyListeners();
  }

//------------------------vdeo picking/playing/removing mechanism ends from here------------------------

  File? truckImage;

  void setTruckImage(File? image) {
    truckImage = image;
    notifyListeners();
  }

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  bool validateInputs(BuildContext context) {
    if (shopNameController.text.isEmpty) {
      _showError(context, 'Shop Name is required');
      return false;
    }
    if (shopAddressController.text.isEmpty) {
      _showError(context, 'Shop Address is required');
      return false;
    }
    if (emailAddressController.text.isEmpty ||
        !emailAddressController.text.contains('@')) {
      _showError(context, 'Valid Email Address is required');
      return false;
    }
    if (phoneNoController.text.isEmpty) {
      _showError(context, 'Valid Phone Number is required');
      return false;
    }
    if (truckImage == null) {
      _showError(context, 'Front Image is required');
      return false;
    }

    return true;
  }

  void _showError(BuildContext context, String message) {
    Utils.flushBarErrorMessage(message, context);
  }

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> submitData(BuildContext context) async {
    setLoading(true);
    try {
      var data = {
        'shopNameController': shopNameController.text.trim(),
        'shopAddressController': shopAddressController.text.trim(),
        'emailAddressController': emailAddressController.text.trim(),
        'phoneNoController': phoneNoController.text.trim(),
        'frontImage': truckImage,
      };
      print('::: data is ${data}');
      Future.delayed(Duration(seconds: 2), () {
        setLoading(false);
        Utils.snackBar('Application submitted successfully', context);
      });
      // var response = await authRepository.continueWithPhoneNumberApi(fullPhone);
    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    }
  }

  String? _selectedTransmission;

  String? get selectedTransmission => _selectedTransmission;

  void selectTransmission(String transmission) {
    _selectedTransmission = transmission;
    notifyListeners();
  }



  void clearAll() {
    shopNameController.clear();
    shopAddressController.clear();
    emailAddressController.clear();
    phoneNoController.clear();
    truckImage = null;
    notifyListeners(); // Notify UI of state changes
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }
}
