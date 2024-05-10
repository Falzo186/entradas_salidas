
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Vista/EntryChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleEntradaCamion extends StatelessWidget {
  final Agenda2 entrada;

  const DetalleEntradaCamion({super.key, required this.entrada});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Entrada', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
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
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
    );
  }
}
