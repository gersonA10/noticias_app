import 'package:flutter/material.dart';
import 'package:noticias_app/presentation/providers/news_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
// import 'package:noticias_app/presentation/widgets/custom_body_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias App'),
      ),
      body: CustomBody(news: newsProvider.newsList,),
    );
  }
}

