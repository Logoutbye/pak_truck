import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/data/response/base_response.dart';
import 'package:testt/src/features/sell/view/ad_posted_screen.dart';
import 'package:testt/src/repository/ads_api/ad_repository.dart';

class SellSparePartsViewModel extends ChangeNotifier {
  final AdRepository sellRepository;

  SellSparePartsViewModel({required this.sellRepository}) {
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

  // ---------------------Controllers for truck info
  TextEditingController cateogryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // ---------------------- validations

  //Field-specific error messages
  Map<String, String?> _fieldErrors = {};

  Map<String, String?> get fieldErrors => _fieldErrors;

  void _addErrorClearListeners() {
    priceController.addListener(() => _clearFieldError('Price'));
    locationController.addListener(() => _clearFieldError('Location'));

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
    if (cateogryController.text.isEmpty) {
      _fieldErrors['Category'] = 'Category is required';
    }
    if (priceController.text.isEmpty) {
      _fieldErrors['Price'] = 'Price is required';
    }
    if (locationController.text.isEmpty) {
      _fieldErrors['Location'] = 'Location is required';
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
      if (validateSellTruckFields(context)) {
        var data = {
          'category': cateogryController.text.trim(),
          'location': locationController.text.trim(),
          'price': priceController.text.trim(),
          'condition': conditionController.text.trim(),
          'description': descriptionController.text.trim(),
        };

        // Extract Images and Videos from `_media`
        List<File> selectedImages = _media
            .where((item) => item['type'] == 'image')
            .map<File>((item) => item['file'] as File)
            .toList();

        List<File> selectedVideos = _media
            .where((item) => item['type'] == 'video')
            .map<File>((item) => item['file'] as File)
            .toList();

        final response = await sellRepository.createSparePartAd(
          data,
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
      }

    } catch (error) {
      Utils.snackBar('Failed to submitted. Please try again.', context);
      setLoading(false);
    }
  }

  @override
  void dispose() {
    cateogryController.clear();
    priceController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
