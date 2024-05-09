
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Vista/EntryChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleEntradaCamion extends StatelessWidget {
  final Agenda2 entrada;

  DetalleEntradaCamion({required this.entrada});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Entrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Folio: ${entrada.folio}'),
            Text('Camión: ${entrada.matriculaCamion}'),
            Text('Nombre del Conductor: ${entrada.nombreOperador}'),
            Text( 'Fecha: ${entrada.fecha}'),
            Text('Tipo de Carga: ${entrada.tipodeCarga}'),
            Text('Peso de Carga: ${entrada.pesoCarga}'),
            Text('Destino de Carga: ${entrada.destinoCarga}'),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EntryChecklistScreen(entrada: entrada),
                          ),
                        );
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
