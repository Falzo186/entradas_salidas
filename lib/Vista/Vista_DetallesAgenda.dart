import '../Modelo/Camion.dart';
import 'package:flutter/material.dart';

class VistaDetallesAgenda extends StatelessWidget {
  final Camion camion;
  final String estadoActual;

  const VistaDetallesAgenda({required this.camion, required this.estadoActual, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Camión - ${camion.matricula}'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Matrícula/Número de Serie: ${camion.matricula}'),
          ),
          ListTile(
            title: Text('Estado Actual: $estadoActual'),
          ),
          const ListTile(
            title: Text('Hora de Entrada: ___'),
          ),
          const ListTile(
            title: Text('Hora de Salida: ___'),
          ),
          const ListTile(
            title: Text('Últimas Entradas: [Historial de entradas con fechas y horas]'),
          ),
          const ListTile(
            title: Text('Últimas Salidas: [Historial de salidas con fechas y horas]'),
          ),
        ],
      ),
    );
  }
}