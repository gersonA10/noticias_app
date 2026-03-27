import 'package:flutter/material.dart';
import 'package:noticias_app/presentation/providers/prestamos_provider.dart';
import 'package:provider/provider.dart';

class BodyPrestamos extends StatelessWidget {
  const BodyPrestamos({super.key});

  @override
  Widget build(BuildContext context) {
    Color colest;
    final prestamoProvider = Provider.of<PrestamosProvider>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Icons.search),
              hint: Text('data'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
          // margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: prestamoProvider.paginas.length,
            itemBuilder: (BuildContext context, int index) {
              final menuLabel = prestamoProvider.paginas[index]['menu'];
              return ChoiceChip(
                avatar: Icon(prestamoProvider.paginas[index]['icon'], color: prestamoProvider.estadoColor(menuLabel),),
                label: Text("$menuLabel"),
                backgroundColor: Colors.white,
                selectedColor: Colors.black,
                selected: prestamoProvider.selectIndex == index,
                labelStyle: TextStyle(
                  color: prestamoProvider.selectIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
                onSelected: (selected) {
                  if (selected) {
                    prestamoProvider.changeIndex(index);
                    prestamoProvider.getList(menuLabel);
                  }
                  // prestamoProvider.changeIndex(index);
                },
              );
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 3),
              //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.white,
              //   ),
              //   child: GestureDetector(
              //     onTap: () {
              //       prestamoProvider.getList(prestamoProvider.paginas[index]['menu']);
              //       print(prestamoProvider.paginas[index]['menu']);
              //     },
              //     child: Row(
              //       children: [
              //         Icon(prestamoProvider.paginas[index]["icon"], color: prestamoProvider.estadoColor(prestamoProvider.paginas[index]["menu"]),),
              //         SizedBox(width: 5),
              //         Text(prestamoProvider.paginas[index]["menu"]),
              //       ],
              //     ),
              //   ),
              // )
              // ;
            },
          ),
        ),
        // SizedBox(height: 0),
        Expanded(
          child: ListView.builder(
            itemCount: prestamoProvider.data.length,
            itemBuilder: (BuildContext context, int index) {
              double pendprest = prestamoProvider.data[index].pendientePrestamo;
              double totprest = prestamoProvider.data[index].totalPrestado;
              double pagpres = totprest - pendprest;
              double porcenta = ((pagpres / totprest) * 100) == 0
                  ? 100
                  : pagpres / totprest * 100;
              colest = prestamoProvider.estadoColor(
                prestamoProvider.data[index].estado,
              );
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border(left: BorderSide(color: colest, width: 5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: colest.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            prestamoProvider.data[index].estado,
                            style: TextStyle(color: colest),
                          ),
                        ),
                        Expanded(child: Text('')),
                        Icon(Icons.more_vert_outlined),
                      ],
                    ),
                    Text(
                      prestamoProvider.data[index].nombreMinera,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'ID: ${prestamoProvider.data[index].idMinera}',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Prestado'),
                            Text('\$ $totprest'),
                            SizedBox(height: 20),
                            Text('Proceso de pago'),
                          ],
                        ),
                        Expanded(child: Text('')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Pendiente'),
                            Text('\$ $pendprest'),
                            SizedBox(height: 20),
                            Text('${porcenta.toInt()}%'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Stack(
                      children: [
                        Container(
                          height: 5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: porcenta / 100,
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(color: colest),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.error_outline_outlined, size: 18),
                        SizedBox(width: 10),
                        Text('estado'),
                        SizedBox(width: 10),
                        Text(
                          "${prestamoProvider.data[index].fecha.day} ${prestamoProvider.data[index].fecha.month} ${prestamoProvider.data[index].fecha.year}",
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
