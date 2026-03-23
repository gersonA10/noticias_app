import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';
import 'package:http/http.dart' as http;

String _apiKey = 'pub_68f1e23e76fb49dab0fe92f98ce3e803';
// String _language = 'language=es';
String url = 'https://newsdata.io/api/1/';

TextEditingController search = TextEditingController();

class NewsProvider extends ChangeNotifier {
  TextEditingController languageController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<String> idiomas = ['es', 'en', 'fr', 'pt'];
  List<String> paises = ['bo', 'us', 'mx', 'cl'];

  List<Map<String, String>> categoria = [
    {'categoria': 'news', 'nombre': 'All'},
    {'categoria': 'latest', 'nombre': 'ultimas'},
    {'categoria': 'market', 'nombre': 'Mercado'},
    {'categoria': 'crypto', 'nombre': 'Crypto'},
    {'categoria': 'sources', 'nombre': 'Detalles'},
  ];
  String? endpoint;

  String? language;
  String? country;

  List<NewsResultModel> newsList = [];

  bool isLoading = false;

  NewsProvider() {
    getNews();
  }

  Future<void> getNews({
    String endpoint = 'news',
    String query = '',
    String language = 'es',
    String country = '',
  }) async {
    isLoading = true;
    notifyListeners();
    
    try {
      final uri = Uri.parse(url + endpoint).replace(
        queryParameters: {
          'apikey': _apiKey,
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

  Future<void> changeCategory(String endpoint) async {
    await getNews(endpoint: endpoint);
    // newsList.clear();
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
