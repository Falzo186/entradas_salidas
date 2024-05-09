
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Vista/ExitChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleSalidaCamion extends StatelessWidget {
  final Agenda2 salida;

  DetalleSalidaCamion({required this.salida});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Salida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Folio: ${salida.folio}'),
            Text('Camión: ${salida.matriculaCamion}'),
            Text('Nombre del Conductor: ${salida.nombreOperador}'),
            Text( 'Fecha: ${salida.fecha}'),
            Text('Tipo de Carga: ${salida.tipodeCarga}'),
            Text('Peso de Carga: ${salida.pesoCarga}'),
            Text('Destino de Carga: ${salida.destinoCarga}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExitChecklistScreen(),
                          ),
                        );
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
