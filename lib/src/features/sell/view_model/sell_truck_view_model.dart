import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/sell/model/sell_truck_model/sell_truck_model.dart';

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

  // ------------------------pick media------------------------

  final List<Map<String, dynamic>> _media = [];
  List<Map<String, dynamic>> get media => _media;

  void addMedia(File file, String type) {
    _media.add({'file': file, 'type': type});
    notifyListeners();
  }

  void removeMedia(int index) {
    _media.removeAt(index);
    notifyListeners();
  }

  void clearMedia() {
    _media.clear();
    notifyListeners();
  }

  // ------------------------pick images------------------------

  // final List<File> _images = [];
  // List<File> get images => _images;

  // void addImage(File image) {
  //   _images.add(image);
  //   notifyListeners();
  // }

  // void removeImage(int index) {
  //   _images.removeAt(index);
  //   notifyListeners();
  // }

  // void clearImages() {
  //   _images.clear();
  //   notifyListeners();
  // }
//------------------------ vdeo picking/playing/removing mechanism starts from here------------------------

  // File? _video;
  // VideoPlayerController? _videoController;

  // bool _isPlaying = false;
  // bool get isPlaying => _isPlaying;

  // File? get truckVideo => _video;
  // VideoPlayerController? get videoController => _videoController;

  // void setVideo(File videoFile) {
  //   _video = videoFile;
  //   _videoController?.dispose();
  //   _videoController = VideoPlayerController.file(videoFile)
  //     ..initialize().then((_) {
  //       notifyListeners();
  //     });
  //   _isPlaying = false;
  //   notifyListeners();
  // }

  // void playVideo() {
  //   _videoController?.play();
  //   _isPlaying = true;
  //   notifyListeners();
  // }

  // void pauseVideo() {
  //   _videoController?.pause();
  //   _isPlaying = false;
  //   notifyListeners();
  // }

  // void stopVideo() {
  //   _videoController?.pause();
  //   _videoController?.seekTo(Duration.zero);
  //   _isPlaying = false;
  //   notifyListeners();
  // }

  // void removeVideo() {
  //   _video = null;
  //   _videoController?.dispose();
  //   _videoController = null;
  //   _isPlaying = false;
  //   notifyListeners();
  // }

  // ---------------------Controllers for truck info
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cateogryController = TextEditingController();
  TextEditingController registeredInController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController truckMakeController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  String? _selectedEngineType;

  String? get selectedEngineType => _selectedEngineType;

  void selectEngineType(String engineType) {
    _selectedEngineType = engineType;
    notifyListeners();
  }

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
    priceController.addListener(() => _clearFieldError('Price'));
    locationController.addListener(() => _clearFieldError('Location'));
    cateogryController.addListener(() => _clearFieldError('Category'));
    registeredInController.addListener(() => _clearFieldError('Registered In'));
    yearController.addListener(() => _clearFieldError('Truck Year'));
    truckMakeController.addListener(() => _clearFieldError('Truck Make'));

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
    // if (images.isEmpty) {
    //   Utils.flushBarErrorMessage('Please select image of your truck', context);
    // }
    // if (truckVideo == null) {
    //   Utils.flushBarErrorMessage('Please select video of your truck', context);
    // }
    if (selectedTransmission == null) {
      Utils.flushBarErrorMessage('Please select Transmission type', context);
    }
    if (priceController.text.isEmpty) {
      _fieldErrors['Price'] = 'Price is required';
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
      // Prepare the SellTruckModel object
      final truckData = SellTruckModel(
        // truckImages:
        //     _images.map((image) => image.path).toList(), // List of image paths
        // truckVideo: truckVideo?.path ?? '', // Video file path
        price: priceController.text.trim(),
        location: locationController.text.trim(),
        category: cateogryController.text.trim(),
        registeredIn: registeredInController.text.trim(),
        truckYear: yearController.text.trim(),
        truckMake: truckMakeController.text.trim(),

        description: descriptionController.text.trim(),
        transmissionType: selectedTransmission ?? '',
        selectedFeatures: selectedFeatures,
        sellerName: sellerNameController.text.trim(),
        mobileNumber: sellerMobileController.text.trim(),
        address: selllerAddressController.text.trim(),
        comments: sellerCommentController.text.trim(),
        allowWhatsappContact: allowWhatsappContact,
      );

      // Print the truckData for debugging (or send to an API)
      print('Prepared Truck Data: ${truckData.toJson()}');

      // Simulate API submission
      await Future.delayed(const Duration(seconds: 2));
      setLoading(false);

      Utils.snackBar('Application submitted successfully', context);

      // Navigate to a success screen or reset form (optional)
      clearForm();
    } catch (error) {
      Utils.flushBarErrorMessage(
          'Failed to submit. Please try again.', context);
      setLoading(false);
    }
  }

  void clearForm() {
    // images.clear;
    // removeVideo();
    priceController.clear();
    locationController.clear();
    cateogryController.clear();
    registeredInController.clear();
    yearController.clear();
    truckMakeController.clear();
    descriptionController.clear();
    sellerNameController.clear();
    sellerMobileController.clear();
    selllerAddressController.clear();
    sellerCommentController.clear();
    _selectedTransmission = null;
    _selectedFeatures.clear();
    _allowWhatsappContact = false;
    notifyListeners();
  }

  @override
  void dispose() {
    priceController.dispose();
    locationController.dispose();
    cateogryController.dispose();
    registeredInController.dispose();
    yearController.dispose();
    truckMakeController.dispose();
    descriptionController.dispose();
    // _videoController?.dispose();
    super.dispose();
  }
}
