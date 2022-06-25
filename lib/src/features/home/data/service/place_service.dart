import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_app/src/features/home/data/model/address_model.dart';
import 'package:my_app/src/features/home/data/model/result_model.dart';

class PlaceService {
  PlaceService(this._placeUrl, this._apiKey, this._client);

  late final String _placeUrl;
  late final String _apiKey;
  late final Client _client;

  Future<ResultModel?> getPlaces(String address) async {
    final url = Uri.https(
      _placeUrl,
      '/maps/api/place/nearbysearch/json',
      <String, dynamic>{
        'keyword': address,
        'location': '4.6447309,-74.1274703',
        'radius': '3000000',
        'type': 'restaurant',
        'key': _apiKey,
      },
    );

    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      if (jsonResponse['error_message'] != null) {
        throw Exception(jsonResponse['error_message'] as String);
      }

      final resultList = jsonResponse['results'] as List<dynamic>;
      return ResultModel(
        results: [
          for (final item in resultList)
            AddressModel.fromJson(item as Map<String, dynamic>),
        ],
      );
    } else {
      return null;
    }
  }
}
