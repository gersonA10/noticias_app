import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
   final NewsResultModel arguments = ModalRoute.of(context)!.settings.arguments as NewsResultModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
    );
  }
}