import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/sell/model/spare_parts/spare_parts_model.dart';

class SellSparePartsViewModel extends ChangeNotifier {
  SellSparePartsViewModel() {
    _addErrorClearListeners();
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

  // // ------------------------pick images------------------------

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

  // ---------------------Controllers for truck info
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
    titleController.addListener(() => _clearFieldError('Title'));

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

    if (priceController.text.isEmpty) {
      _fieldErrors['Price'] = 'Price is required';
    }
    if (locationController.text.isEmpty) {
      _fieldErrors['Location'] = 'Location is required';
    }
    if (titleController.text.isEmpty) {
      _fieldErrors['Title'] = 'Title is required';
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
      if (validateSellTruckFields(context)) {
        SparePartsModel spareParts = SparePartsModel(
          location: locationController.text.trim(),
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          sellerName: sellerNameController.text.trim(),
          mobileNumber: sellerMobileController.text.trim(),
          address: selllerAddressController.text.trim(),
          comments: sellerCommentController.text.trim(),
          allowWhatsappContact: allowWhatsappContact,
        );

        print(spareParts.toString());

        // Further actions: Send to API, Save to Database, etc.
      }
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
    priceController.dispose();
    locationController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
