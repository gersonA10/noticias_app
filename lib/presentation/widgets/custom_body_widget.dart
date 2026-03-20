import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_model.dart';
import 'package:noticias_app/presentation/providers/news_provider.dart';
import 'package:provider/provider.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.news});

  final List<NewsResultModel> news;

  @override
  Widget build(BuildContext context) {
    final listprovider = Provider.of<NewsProvider>(context);
    return Column(
      children: [
        Container(
          height: 80,
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(onPressed: (){listprovider.searchController.clear();}, icon: Icon(Icons.cancel_rounded)),
              Expanded(
                child: TextFormField(
                  controller: listprovider.searchController,
                  onFieldSubmitted: (value){
                    listprovider.searchNews(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    suffixIcon: IconButton(
                      onPressed: () {
                        listprovider.searchNews(listprovider.searchController.text);
                        // listprovider.getApip(listprovider.search.text);
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: news.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final noticia = news[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: noticia,
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            width: 120,
                            height: 200,
                            placeholder: AssetImage('assets/loading.gif'),
                            image: NetworkImage(noticia.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                noticia.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                noticia.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                // noticia.creator?.first ?? '',
                                noticia.creator!.isEmpty
                                    ? 'Sin autor'
                                    : noticia.creator![0],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                noticia.pubDate.toString(),
                                // noticia.creator!.isEmpty ? 'Sin autor' : noticia.creator![0],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
