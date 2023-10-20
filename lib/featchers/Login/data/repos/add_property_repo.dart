import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/search_property/data/models/parms/add_farm_parms.dart';
import 'package:homy_hon/featchers/search_property/data/models/parms/add_property_parms.dart';
import 'package:homy_hon/featchers/search_property/data/models/parms/add_shop_parms.dart';

class AddPropertyRepo {
  static Future<Either<String, String>> UploadPhoto(File photo) async {
    FormData formData = FormData();
    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(
        photo.path,
        filename: 'image.jpg',
      ),
    ));
    return BaseApiClient.post(
      formData: formData,
      url: Links.baseUrl + Links.startPoint + Links.uploadPhoto,
      converter: (value) {
        return value["Link"];
      },
    );
  }

  static Future<Either<String, String>> addProperty(
      AddPropertyPrams addPropertyPrams) async {
    return BaseApiClient.post(
      formData: FormData.fromMap(addPropertyPrams.toJson()),
      url: Links.baseUrl + "api/property/house/add",
      converter: (value) {
        return value["Message"];
      },
    );
  }

  static Future<Either<String, String>> addShopProperty(
      AddShopPrams addShopPrams) async {
    return BaseApiClient.post(
      formData: FormData.fromMap(addShopPrams.toJson()),
      url: Links.baseUrl + "api/property/shop/add",
      converter: (value) {
        return value["Message"];
      },
    );
  }

  static Future<Either<String, String>> addFarmProperty(
      AddFarmPrams addFarmPrams) async {
    return BaseApiClient.post(
      formData: FormData.fromMap(addFarmPrams.toJson()),
      url: Links.baseUrl + "api/property/farm/add",
      converter: (value) {
        return value["Message"];
      },
    );
  }
    static Future<Either<String, String>> delete(
      AddFarmPrams addFarmPrams) async {
    return BaseApiClient.post(
      formData: FormData.fromMap(addFarmPrams.toJson()),
      url: Links.baseUrl + "api/property/farm/add",
      converter: (value) {
        return value["Message"];
      },
    );
  }
}
