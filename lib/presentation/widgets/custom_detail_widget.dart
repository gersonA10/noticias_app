import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';

class CustomDetailWidget extends StatelessWidget {
  final NewsResultModel noticias;

  const CustomDetailWidget({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: 400,
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(noticias.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_rounded, color: Colors.white,)),
        ),
        Container(
          padding: EdgeInsets.all(15),
          height: size.height * 1,
          margin: EdgeInsets.only(top: 300),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView(
            children: [
              Text(
                noticias.creator!.isEmpty ? 'Sin autor' : noticias.creator![0],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(noticias.title, style: TextStyle(fontSize: 20)),
              Text(noticias.description),
            ],
          ),
        ),
      ],
    );
  }
}
