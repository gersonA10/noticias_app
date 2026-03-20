import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';
import 'package:http/http.dart' as http;

String _apiKey = 'pub_18599e0928443ca56e14da79d622b60bcd62b';
// String _language = 'language=es';
String url = 'https://newsdata.io/api/1/news';

TextEditingController search = TextEditingController();

class NewsProvider extends ChangeNotifier {
  TextEditingController languageController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<String> idiomas = ['es', 'en', 'fr', 'pt'];
  List<String> paises = ['bo', 'us', 'mx', 'cl'];
  String? language;
  String? country;

  List<NewsResultModel> newsList = [];

  bool isLoading = false;

  NewsProvider() {
    getNews();
  }

  Future<void> getNews({String query = '', String language = 'es', String country = 'us'}) async {
    isLoading = true;
    notifyListeners();

    try {
      final uri = Uri.parse(url).replace(
        queryParameters: {
          'apiKey': _apiKey,
          if (query.trim().isNotEmpty) 'q': query.trim(),
          if (language.trim().isNotEmpty) 'language': language.trim(),
          if (country.trim().isNotEmpty) 'country': country.trim(),
          // 'q':
        },
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = newsModelFromJson(
          const Utf8Decoder().convert(response.bodyBytes),
        );

        newsList = data.results;
        notifyListeners();
      } else {
        newsList = [];
      }
    } catch (e) {
      newsList = [];
    }
  }

  Future<void> searchNews(String text) async {
    await getNews(query: text);
  }

  Future<void> changeFilters(String language, String country) async {
    await getNews(language: language, country: country);
  }

  Future<void> clearSearch() async {
    await getNews();
  }

  // void getApi() async {
  //   final response = await http.get(Uri.parse(url));

  //   final data = newsModelFromJson(const Utf8Decoder().convert(response.bodyBytes));
  //   newsList.addAll(data.results);
  //   // print(url+"&q=pizza");
  //   notifyListeners();
  // }

  // void getApip(String valor) async{
  //   // newsList.clear();
  //   String busqueda = "&q=$valor";
  //   final response = await http.get(Uri.parse(url+busqueda));
  //   final datanew = newsModelFromJson(const Utf8Decoder().convert(response.bodyBytes));
  //   newsList = datanew.results;
  //   notifyListeners();
  // }
}
