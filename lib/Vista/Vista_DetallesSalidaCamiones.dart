
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Vista/ExitChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleSalidaCamion extends StatefulWidget {
  final Agenda2 salida;
  final String usuario;

  const DetalleSalidaCamion({super.key, required this.salida, required this.usuario});

  @override
  State<DetalleSalidaCamion> createState() => _DetalleSalidaCamionState();
}

class _DetalleSalidaCamionState extends State<DetalleSalidaCamion> {
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
            Text('Folio: ${widget.salida.folio}'),
            Text('Camión: ${widget.salida.matriculaCamion}'),
            Text('Nombre del Conductor: ${widget.salida.nombreOperador}'),
            Text( 'Fecha: ${widget.salida.fecha}'),
            Text('Tipo de Carga: ${widget.salida.tipodeCarga}'),
            Text('Peso de Carga: ${widget.salida.pesoCarga}'),
            Text('Destino de Carga: ${widget.salida.destinoCarga}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExitChecklistScreen(salida: widget.salida,usuario: widget.usuario),
                          ),
                        );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
    );
  }
}
