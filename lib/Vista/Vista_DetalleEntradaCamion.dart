
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Vista/EntryChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleEntradaCamion extends StatefulWidget {
  final Agenda2 entrada;
  final String usuario;

  const DetalleEntradaCamion({super.key, required this.entrada, required this.usuario});

  @override
  State<DetalleEntradaCamion> createState() => _DetalleEntradaCamionState();
}

class _DetalleEntradaCamionState extends State<DetalleEntradaCamion> {
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
            Text('Folio: ${widget.entrada.folio}'),
            Text('Camión: ${widget.entrada.matriculaCamion}'),
            Text('Nombre del Conductor: ${widget.entrada.nombreOperador}'),
            Text( 'Fecha: ${widget.entrada.fecha}'),
            Text('Tipo de Carga: ${widget.entrada.tipodeCarga}'),
            Text('Peso de Carga: ${widget.entrada.pesoCarga}'),
            Text('Destino de Carga: ${widget.entrada.destinoCarga}'),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EntryChecklistScreen(entrada: widget.entrada,usuario: widget.usuario),
                          ),
                        );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
    );
  }
}
