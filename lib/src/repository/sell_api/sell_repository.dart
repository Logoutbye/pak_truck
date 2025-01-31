import 'dart:io';

abstract class SellRepository {
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
}
