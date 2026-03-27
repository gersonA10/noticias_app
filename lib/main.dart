import 'package:flutter/material.dart';
import 'package:noticias_app/presentation/providers/news_provider.dart';
import 'package:noticias_app/presentation/providers/pokemon_provider.dart';
import 'package:noticias_app/presentation/providers/prestamos_provider.dart';
import 'package:noticias_app/presentation/screens/details_screen.dart';
import 'package:noticias_app/presentation/screens/pokemon_screen.dart';
import 'package:noticias_app/presentation/screens/prestamos_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/screens.dart';
// import 'package:noticias_app/presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
        ChangeNotifierProvider(create: (_) => PrestamosProvider())
      ],
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
      initialRoute: '/prestamos',
      routes: {
        '/home': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/pokemon': (context) => PokemonScreen(),
        '/prestamos': (context) => PrestamosScreen()
      },
    );
  }
}
