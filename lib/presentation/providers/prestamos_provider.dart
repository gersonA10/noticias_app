import 'package:flutter/material.dart';

class PrestamosProvider extends ChangeNotifier {
  
  String filtroActual = "Todos";

  int selectIndex = 0;
  List<MineraData> data = [];
  List<Map<String, dynamic>> paginas = [
    {"menu": 'Todos', "icon": Icons.border_all},
    {"menu": 'Activo', "icon": Icons.play_circle_outline},
    {"menu": 'En Mora', "icon": Icons.dangerous},
    {"menu": 'Finalizado', "icon": Icons.check_circle_outline},
  ];

  Future<void> getList(String estado) async {
    filtroActual = estado;

    if (estado == "Todos") {
      data = datos;
    } else {
      data = datos.where((item) => item.estado == estado).toList();
    }

    notifyListeners();
  }
  
  MaterialColor estadoColor(String estado) {
    switch (estado) {
      case "Activo":
        return Colors.blue;
      case "En Mora":
        return Colors.red;
      case "Finalizado":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  
  void changeIndex (int index){
    selectIndex = index;
    notifyListeners();
  }
  List<MineraData> datos = [
    MineraData(
      idMinera: 'LP-2023-884',
      nombreMinera: 'Minera San Cristobal S.A',
      totalPrestado: 50000.0,
      pendientePrestamo: 12500.0,
      fecha: DateTime(2023, 10, 15),
      estado: "Activo",
    ),
    MineraData(
      idMinera: 'LP-2023-884',
      nombreMinera: 'Transporte del Sur SRL',
      totalPrestado: 120000,
      pendientePrestamo: 45200,
      fecha: DateTime(2023, 10, 15),
      estado: "En Mora",
    ),
    MineraData(
      idMinera: 'LP-2023-884',
      nombreMinera: 'Coperativa El Progreso',
      totalPrestado: 50000.0,
      pendientePrestamo: 50000.0,
      fecha: DateTime(2023, 10, 15),
      estado: "Finalizado",
    ),
    MineraData(
      idMinera: 'LP-2023-884',
      nombreMinera: 'Minera San Luis Potosi S.A',
      totalPrestado: 50000.0,
      pendientePrestamo: 500.0,
      fecha: DateTime(2023, 10, 15),
      estado: "Activo",
    ),
  ];
}

class MineraData {
  final String idMinera;
  final String nombreMinera;
  final double totalPrestado;
  final double pendientePrestamo;
  final DateTime fecha;
  final String estado;

  MineraData({
    required this.idMinera,
    required this.nombreMinera,
    required this.totalPrestado,
    required this.pendientePrestamo,
    required this.fecha,
    required this.estado,
  });
}
