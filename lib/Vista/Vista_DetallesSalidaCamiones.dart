import 'package:entradas_salidas/Modelo/SalidaCamiones.dart';
import 'package:entradas_salidas/Vista/ExitChecklistScreen.dart';
import 'package:flutter/material.dart';

class DetalleSalidaCamion extends StatelessWidget {
  final SalidaCamiones salida;

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
            Text('Camión: ${salida.matriculaCamion}'),
            Text('Hora de Salida: ${salida.horaSalida}'),
            Text('Tipo de Carga: ${salida.tipodeCarga}'),
            Text('Peso de Carga: ${salida.pesoCarga}'),
            Text('Destino de Carga: ${salida.destinoCarga}'),
            Text('Nombre del Conductor: ${salida.nombreConductor}'),
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
