import 'package:flutter/material.dart';
import 'package:noticias_app/presentation/widgets/body_prestamos_widget.dart';

class PrestamosScreen extends StatelessWidget {
  const PrestamosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context,'/home');
        }, icon: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(),
        title: Text('Prestamos internos'),
        actions: [
          Text('Filtros'),
          SizedBox(width: 10)
        ],
      ),
      body: BodyPrestamos(),
    );
  }
}
