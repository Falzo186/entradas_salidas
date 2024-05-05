import 'package:entradas_salidas/Modelo/Agenda.dart';
import 'package:entradas_salidas/Modelo/EntradaCamiones.dart';
import 'package:entradas_salidas/Vista/EntryChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleEntradaCamion extends StatelessWidget {
  final Agenda entrada;

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
            Text('Hora de Entrada: ${entrada.hora}'),
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
                            builder: (context) => const EntryChecklistScreen(),
                          ),
                        );
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
