import 'dart:io';

import 'package:testt/src/model/truck_model/truck_model.dart';

abstract class AdRepository {
  Future<dynamic> createVechileAd(
    dynamic data, {
    List<File>? images,
    List<File>? videos,
  });
  Future<dynamic> createSparePartAd(
    dynamic data, {
    List<File>? images,
    List<File>? videos,
  });

  Future<List<TruckModel>> fetchMyAds();
}
