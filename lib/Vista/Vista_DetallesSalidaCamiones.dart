
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Vista/ExitChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleSalidaCamion extends StatelessWidget {
  final Agenda2 salida;

  const DetalleSalidaCamion({super.key, required this.salida});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Salida', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      toolbarHeight: 80,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 58, 47),
              Color.fromARGB(255, 52, 174, 190),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
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
                            builder: (context) => ExitChecklistScreen(salida: salida),
                          ),
                        );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
    );
  }
}
