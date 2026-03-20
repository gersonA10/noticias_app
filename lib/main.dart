import 'package:flutter/material.dart';
import 'package:noticias_app/presentation/providers/news_provider.dart';
import 'package:noticias_app/presentation/screens/details_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/screens.dart';
// import 'package:noticias_app/presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}
