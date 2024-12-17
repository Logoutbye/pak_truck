import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:video_player/video_player.dart';

class SellTuckViewModel extends ChangeNotifier {
  SellTuckViewModel() {
    _addErrorClearListeners();
  }
  // ------------------------selling truck plans------------------------
  String _choosePlan = '';
  String get choosePlan => _choosePlan;

  void setPlan(String plan) {
    _choosePlan = plan;
    notifyListeners();
  }

  // ------------------------pick images------------------------
  File? truckImage;
  void setTruckImage(File? image) {
    truckImage = image;
    notifyListeners();
  }
//------------------------ vdeo picking/playing/removing mechanism starts from here------------------------

  File? _video;
  VideoPlayerController? _videoController;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  File? get truckVideo => _video;
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

  // ---------------------Controllers for truck info
  TextEditingController locationController = TextEditingController();
  TextEditingController cateogryController = TextEditingController();
  TextEditingController registeredInController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController truckMakeController = TextEditingController();
  TextEditingController truckModelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController engineTypeController = TextEditingController();
  TextEditingController engineCapacityController = TextEditingController();
  TextEditingController engineMillageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // ------------------- manual or automatic
  String? _selectedTransmission;

  String? get selectedTransmission => _selectedTransmission;

  void selectTransmission(String transmission) {
    _selectedTransmission = transmission;
    notifyListeners();
  }

//-------------------select features-----------------------

  final List<String> _selectedFeatures = [];

  List<String> get selectedFeatures => _selectedFeatures;

  void toggleFeature(String feature) {
    if (_selectedFeatures.contains(feature)) {
      _selectedFeatures.remove(feature);
    } else {
      _selectedFeatures.add(feature);
    }
    notifyListeners();
  }

  bool isSelected(String feature) => _selectedFeatures.contains(feature);

  // ---------------------Controllers for seller contact  info

  TextEditingController sellerNameController = TextEditingController();
  TextEditingController sellerMobileController = TextEditingController();
  TextEditingController selllerAddressController = TextEditingController();
  TextEditingController sellerCommentController = TextEditingController();

  //-------------------allow contact on whatsapp-----------------------

  bool _allowWhatsappContact = false;

  bool get allowWhatsappContact => _allowWhatsappContact;

  void toggleWhatsappContact(bool value) {
    _allowWhatsappContact = value;
    notifyListeners();
  }

  // ---------------------- validations

  //Field-specific error messages
  Map<String, String?> _fieldErrors = {};

  Map<String, String?> get fieldErrors => _fieldErrors;

  void _addErrorClearListeners() {
    locationController.addListener(() => _clearFieldError('Location'));
    cateogryController.addListener(() => _clearFieldError('Category'));
    registeredInController.addListener(() => _clearFieldError('Registered In'));
    yearController.addListener(() => _clearFieldError('Truck Year'));
    truckMakeController.addListener(() => _clearFieldError('Truck Make'));
    truckModelController.addListener(() => _clearFieldError('Truck Model'));
    colorController.addListener(() => _clearFieldError('Color'));
    engineTypeController.addListener(() => _clearFieldError('Engine Type'));
    engineCapacityController
        .addListener(() => _clearFieldError('Engine Capacity'));
    engineMillageController
        .addListener(() => _clearFieldError('Engine Mileage'));
    descriptionController.addListener(() => _clearFieldError('Description'));
    sellerNameController.addListener(() => _clearFieldError('Name'));
    sellerMobileController.addListener(() => _clearFieldError('Mobile Number'));
    selllerAddressController.addListener(() => _clearFieldError('Address'));
  }

  void _clearFieldError(String fieldName) {
    if (_fieldErrors.containsKey(fieldName)) {
      _fieldErrors.remove(fieldName);
      notifyListeners();
    }
  }

  // Validation Logic
  bool validateSellTruckFields(BuildContext context) {
    _fieldErrors.clear();
    if (truckImage == null) {
      Utils.flushBarErrorMessage('Please select image of your truck', context);
    }
    if (truckVideo == null) {
      Utils.flushBarErrorMessage('Please select video of your truck', context);
    }
    if (selectedTransmission == null) {
      Utils.flushBarErrorMessage('Please select Transmission type', context);
    }
    if (locationController.text.isEmpty) {
      _fieldErrors['Location'] = 'Location is required';
    }
    if (cateogryController.text.isEmpty) {
      _fieldErrors['Category'] = 'Category is required';
    }
    if (registeredInController.text.isEmpty) {
      _fieldErrors['Registered In'] = 'Registration area is required';
    }
    if (yearController.text.isEmpty) {
      _fieldErrors['Truck Year'] = 'Truck year is required';
    }
    if (truckMakeController.text.isEmpty) {
      _fieldErrors['Truck Make'] = 'Truck make is required';
    }
    if (truckModelController.text.isEmpty) {
      _fieldErrors['Truck Model'] = 'Truck model is required';
    }
    if (colorController.text.isEmpty) {
      _fieldErrors['Color'] = 'Color is required';
    }
    if (engineTypeController.text.isEmpty) {
      _fieldErrors['Engine Type'] = 'Engine Type is required';
    }
    if (engineCapacityController.text.isEmpty) {
      _fieldErrors['Engine Capacity'] = 'Engine Capacity is required';
    }
    if (engineMillageController.text.isEmpty) {
      _fieldErrors['Engine Mileage'] = 'Engine Mileage is required';
    }
    if (descriptionController.text.isEmpty) {
      _fieldErrors['Description'] = 'Description is required';
    }
    if (sellerNameController.text.isEmpty) {
      _fieldErrors['Name'] = 'Name is required';
    }
    if (sellerMobileController.text.isEmpty) {
      _fieldErrors['Mobile Number'] = 'Mobile Number is required';
    }
    if (selllerAddressController.text.isEmpty) {
      _fieldErrors['Address'] = 'Address is required';
    }

    notifyListeners();
    return _fieldErrors.isEmpty;
  }

  void clearErrors() {
    _fieldErrors.clear();
    notifyListeners();
  }

// ----------------- api work
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> submitData(BuildContext context) async {
    setLoading(true);
    try {
      var data = {};
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

  @override
  void dispose() {
    locationController.dispose();
    cateogryController.dispose();
    registeredInController.dispose();
    yearController.dispose();
    truckMakeController.dispose();
    truckModelController.dispose();
    colorController.dispose();
    engineTypeController.dispose();
    engineCapacityController.dispose();
    engineMillageController.dispose();
    descriptionController.dispose();
    _videoController?.dispose();
    super.dispose();
  }
}