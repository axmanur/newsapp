import 'dart:convert';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/constants/api.dart';
import 'package:newsapp/model/newmodel.dart';

class NewsApiService {
  Future<List<NewsModel>> fetchNewsData() async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return NewsModel.fromJson(jsonDecode(response.body));
      List data = jsonDecode(response.body)['articles'];

      return data.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

final newsProviderservices = Provider<NewsApiService>((re) {
  return NewsApiService();
});
