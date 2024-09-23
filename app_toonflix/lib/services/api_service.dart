
import 'dart:convert';

import 'package:app_toonflix/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Error();
    }

    List<WebtoonModel> webtoonInstances = [];
    final webtoons = jsonDecode(response.body);
    for (var webtoon in webtoons) {
      webtoonInstances.add(WebtoonModel.fromJson(webtoon));
    }
    return webtoonInstances;
  }
}