import 'dart:convert';
import 'config.dart';
import 'package:http/http.dart' as http;

class GetJson {
  static final IMAGE_URL = 'https://image.tmdb.org/t/p/w500/';
  static Future<Map> getJson() async {
    var apiKey = getApiKey();
    var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
    var response = await http.get(url);
    return json.decode(response.body);
  }
}
