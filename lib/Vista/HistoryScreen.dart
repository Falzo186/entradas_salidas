import 'package:entradas_salidas/Modelo/HistortialEntradas.dart';
import 'package:flutter/material.dart';


class HistoryScreen extends StatefulWidget {
  

    HistoryScreen({Key? key, });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
late  List<HistorialEntradas> historial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: ListView.builder(
        itemCount: historial.length,
        itemBuilder: (context, index) {
          final entry = historial[index];
          Color tileColor = Colors.white; // Por defecto
          
          // colores según el tipo de entrada
          if (entry.tipo == 'Entrada') {
            tileColor = Colors.green;
          } else if (entry.tipo == 'Salida') {
            tileColor = Colors.orange;
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0), 
            child: ListTile(
              title: Text(
                '${entry.tipo} - ${entry.hora}',
                style: const TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
              ),
              tileColor: tileColor, // el color de fondo
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4.0), // espacio entre los elementos
                  Text('Chofer: ${entry.operador}'),
                  Text('ID del camión: ${entry.matriculaCamion}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
