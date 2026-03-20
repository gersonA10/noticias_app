import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';
import 'package:http/http.dart' as http;


String _apiKey = 'pub_18599e0928443ca56e14da79d622b60bcd62b';
String _language = 'language=es';
String url = 'https://newsdata.io/api/1/news?apiKey=$_apiKey&$_language';

TextEditingController search = TextEditingController();

class NewsProvider extends ChangeNotifier {
    
  TextEditingController search = TextEditingController();
  List<NewsResultModel> newsList = [];

  NewsProvider(){
    getApi();
  }


  void getApi() async {
    final response = await http.get(Uri.parse(url));

    final data = newsModelFromJson(const Utf8Decoder().convert(response.bodyBytes));
    newsList.addAll(data.results);
    // print(url+"&q=pizza");
    notifyListeners();
  }

  void getApip(String valor) async{
    // newsList.clear();
    String busqueda = "&q=$valor";
    final response = await http.get(Uri.parse(url+busqueda));
    final datanew = newsModelFromJson(const Utf8Decoder().convert(response.bodyBytes));
    newsList = datanew.results;
    notifyListeners();
  }

}
