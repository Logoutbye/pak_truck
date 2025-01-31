import 'dart:io';
import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../data/network/app_url.dart';
import 'sell_repository.dart';

class SellHttpApiRepository implements SellRepository {
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
}
