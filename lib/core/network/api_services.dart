import 'package:dio/dio.dart';
import 'package:sugar/core/utils/dio_helper.dart';

class ApiServices {
  static Future<Response> fetchEyeModel(String imageBase64) async {
    return DioHelper.postData(
      url: 'eye',
      data: {'image_base64': imageBase64},
    );
  }

  static Future<Response> fetchFoodModel(String imageBase64) async {
    return DioHelper.postData(
      url: 'food',
      data: {'image_base64': imageBase64},
    );
  }

  static Future<Response> fetchSugarModel(double glucoseLevel) async {
    return DioHelper.postData(
      url: 'sugar',
      data: {'glucose_level': glucoseLevel.toString()},
    );
  }
}
