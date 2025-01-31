import 'dart:io';
import 'package:testt/src/model/truck_model/truck_model.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../data/network/app_url.dart';
import 'ad_repository.dart';

class AdHttpApiRepository implements AdRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<dynamic> createVechileAd(
    dynamic data, {
    List<File>? images,
    List<File>? videos,
  }) async {
    try {
      final response = await _apiServices.postMediaApiResponse(
        AppUrl.createVehicleAd,
        data,
        mediaFiles: [...?images, ...?videos], // ✅ Combine images & videos
        mediaFieldNames: [
          ...?images
              ?.map((_) => 'images'), // ✅ Assign 'images' field dynamically
          ...?videos
              ?.map((_) => 'videos'), // ✅ Assign 'videos' field dynamically
        ],
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<dynamic> createSparePartAd(
    dynamic data, {
    List<File>? images,
    List<File>? videos,
  }) async {
    try {
      final response = await _apiServices.postMediaApiResponse(
        AppUrl.createSparePartAd,
        data,
        mediaFiles: [...?images, ...?videos], // ✅ Combine images & videos
        mediaFieldNames: [
          ...?images
              ?.map((_) => 'images'), // ✅ Assign 'images' field dynamically
          ...?videos
              ?.map((_) => 'videos'), // ✅ Assign 'videos' field dynamically
        ],
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }



    @override
  Future<List<TruckModel>> fetchMyAds() async {
    try {
      final response =
          await _apiServices.fetchGetApiResponse(AppUrl.myVehicleAds);

      // ✅ Convert response JSON to a List<TruckModel>
      final List<TruckModel> truckAds = (response['data'] as List)
          .map((json) => TruckModel.fromJson(json))
          .toList();

      return truckAds;
    } catch (error) {
      rethrow;
    }
  }
}
