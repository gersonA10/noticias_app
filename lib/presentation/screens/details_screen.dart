import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';
import 'package:noticias_app/presentation/widgets/custom_detail_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
   final NewsResultModel arguments = ModalRoute.of(context)!.settings.arguments as NewsResultModel;

    return Scaffold(
      // appBar: AppBar(
      //   // title: Text(arguments.title),
      //   backgroundColor: Colors.transparent,
      // ),
      body: CustomDetailWidget(noticias: arguments),
    );
  }
}