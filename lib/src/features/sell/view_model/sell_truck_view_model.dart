import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/data/response/base_response.dart';
import 'package:testt/src/repository/sell_api/sell_repository.dart';

import '../view/ad_posted_screen.dart';

class SellTuckViewModel extends ChangeNotifier {
  final SellRepository sellRepository;

  SellTuckViewModel({required this.sellRepository}) {
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

  // ---------------------Controllers for truck info
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cateogryController = TextEditingController();
  TextEditingController registeredInController = TextEditingController();
  TextEditingController modelYearController = TextEditingController();
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

  //-------------------allow contact on whatsapp-----------------------

  // bool _allowWhatsappContact = false;

  // bool get allowWhatsappContact => _allowWhatsappContact;

  // void toggleWhatsappContact(bool value) {
  //   _allowWhatsappContact = value;
  //   notifyListeners();
  // }

  // ---------------------- validations

  //Field-specific error messages
  Map<String, String?> _fieldErrors = {};

  Map<String, String?> get fieldErrors => _fieldErrors;

  void _addErrorClearListeners() {
    priceController.addListener(() => _clearFieldError('Price'));
    locationController.addListener(() => _clearFieldError('Location'));
    cateogryController.addListener(() => _clearFieldError('Category'));
    registeredInController.addListener(() => _clearFieldError('Registered In'));
    modelYearController.addListener(() => _clearFieldError('Truck Year'));
    truckMakeController.addListener(() => _clearFieldError('Truck Make'));

    descriptionController.addListener(() => _clearFieldError('Description'));
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
    if (modelYearController.text.isEmpty) {
      _fieldErrors['Truck Year'] = 'Truck year is required';
    }
    if (truckMakeController.text.isEmpty) {
      _fieldErrors['Truck Make'] = 'Truck make is required';
    }

    if (descriptionController.text.isEmpty) {
      _fieldErrors['Description'] = 'Description is required';
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
      // Extract category and subcategory
      List<String> categoryParts = cateogryController.text.split('-');

      String mainCategory = categoryParts.isNotEmpty
          ? categoryParts[0].trim()
          : 'Unknown Category';
      String subCategory =
          categoryParts.length > 1 ? categoryParts[1].trim() : 'General';
      // Prepare the SellTruckModel object

      // const { category, subCategory, location, price, modelYear, registeredIn, make, engineType, description, localOrImported } = req.body;

      var truckData = {
        'category': mainCategory,
        'subCategory': subCategory,
        'location': locationController.text.trim(),
        'price': priceController.text.trim(),
        'modelYear': modelYearController.text.trim(),
        'registeredIn': registeredInController.text.trim(),
        'make': truckMakeController.text.trim(),
        'engineType': selectedEngineType.toString(),
        'description': descriptionController.text.trim(),
        'localOrImported': selectedTransmission ?? '',
      };
      // Print the truckData for debugging (or send to an API)
      print('Prepared Truck Data: $truckData');

      // Extract Images and Videos from `_media`
      List<File> selectedImages = _media
          .where((item) => item['type'] == 'image')
          .map<File>((item) => item['file'] as File)
          .toList();

      List<File> selectedVideos = _media
          .where((item) => item['type'] == 'video')
          .map<File>((item) => item['file'] as File)
          .toList();

      final response = await sellRepository.createVechileAd(
        truckData,
        images: selectedImages,
        videos: selectedVideos,
      );
      BaseApiResponse baseResponse = BaseApiResponse.fromJson(response);
        Navigator.push(
            context,
            SlideTransitionPage(
                slideDirection: SlideDirection.top,
                page: PostedSuccessScreen()));
        Utils.snackBar(baseResponse.message.toString(), context);
      
      setLoading(false);

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
    modelYearController.clear();
    truckMakeController.clear();
    descriptionController.clear();
    _selectedTransmission = null;

    notifyListeners();
  }

  @override
  void dispose() {
    priceController.dispose();
    locationController.dispose();
    cateogryController.dispose();
    registeredInController.dispose();
    modelYearController.dispose();
    truckMakeController.dispose();
    descriptionController.dispose();
    // _videoController?.dispose();
    super.dispose();
  }
}
