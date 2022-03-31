import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/model/tourism_place.dart';

class ApiService {
  static final String _baseUrl = "http://192.168.1.9:8000/api/";

  Future<PlaceResult> findAll() async {
    final response = await http.get(Uri.parse(_baseUrl + "places"));
    if (response.statusCode == 200){
      return PlaceResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed load place');
    }
  }

}