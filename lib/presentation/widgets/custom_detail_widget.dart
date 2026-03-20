import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';

class CustomDetailWidget extends StatelessWidget {
  final NewsResultModel noticias;

  const CustomDetailWidget({super.key, required this.noticias});

  @override
  Widget build(BuildContext context, ) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(noticias.imageUrl)
            ),
        ),
        Container(
          height: size.height * 1,
          margin: EdgeInsets.only(top: 200),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30)
          ),
          child: ListView(
            children: [
              Text(noticias.description)
            ],
          ),
        )
      ],
    );
  }
}