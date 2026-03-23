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
              IconButton(
                onPressed: () {
                  listprovider.searchController.clear();
                  listprovider.languageController.clear();
                  listprovider.countryController.clear();
                },
                icon: Icon(Icons.cancel_rounded),
              ),
              Expanded(
                child: TextFormField(
                  controller: listprovider.searchController,
                  onFieldSubmitted: (value) {
                    listprovider.searchNews(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    suffixIcon: IconButton(
                      onPressed: () {
                        listprovider.searchNews(
                          listprovider.searchController.text,
                        );
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filters'),
              Row(
                children: [
                  DropdownMenu(
                    width: 100,
                    enableFilter: true,
                    label: Text('Lang'),
                    inputDecorationTheme: const InputDecorationTheme(
                      contentPadding: EdgeInsets.all(5),
                    ),
                    controller: listprovider.languageController,
                    dropdownMenuEntries: listprovider.idiomas.map((e) {
                      return DropdownMenuEntry(value: e, label: e);
                    }).toList(),
                  ),
                  DropdownMenu(
                    width: 150,
                    label: Text('Country'),
                    controller: listprovider.countryController,
                    enableFilter: true,
                    inputDecorationTheme: InputDecorationTheme(filled: false),
                    dropdownMenuEntries: listprovider.paises.map((e) {
                      return DropdownMenuEntry(value: e, label: e);
                    }).toList(),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          listprovider.changeFilters(
                            listprovider.languageController.text,
                            listprovider.countryController.text,
                          );
                          // print(
                          //   listprovider.languageController.text +
                          //       "  " +
                          //       listprovider.countryController.text
                          // );
                        },
                        child: Center(child: Text('Apply')),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: listprovider.categoria.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 30,
                width: 80,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: GestureDetector(
                  onTap: () {
                    String cat = listprovider.categoria[index]['categoria']!;
                    listprovider.changeCategory(cat);
                    print(listprovider.categoria[index]['categoria']!);
                  },
                  child: Center(
                    child: Text(listprovider.categoria[index]['nombre']!),
                  ),
                ),
              );
            },
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
                              Expanded(
                                child: Text(
                                  // noticia.creator?.first ?? '',
                                  noticia.creator!.isEmpty
                                      ? 'Sin autor'
                                      : noticia.creator![0],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12),
                                ),
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
