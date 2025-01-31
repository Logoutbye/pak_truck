import 'package:flutter/material.dart';
import 'package:testt/src/data/response/api_response.dart';
import 'package:testt/src/model/truck_model/truck_model.dart';
import 'package:testt/src/repository/ads_api/ad_repository.dart';


class VechileAdsViewModel with ChangeNotifier {
  final AdRepository adRepository;

  VechileAdsViewModel({required this.adRepository});

  // ✅ Change to List<TruckModel>
  ApiResponse<List<TruckModel>> myAds = ApiResponse.notStarted();

  setMyAds(ApiResponse<List<TruckModel>> response) {
    myAds = response;
    notifyListeners();
  }

  Future<void> fetchMyAds() async {
    setMyAds(ApiResponse.loading());

    try {
      final List<TruckModel> ads = await adRepository.fetchMyAds();
      setMyAds(ApiResponse.completed(ads));
    } catch (error) {
      setMyAds(ApiResponse.error(error.toString()));
    }
  }
}




