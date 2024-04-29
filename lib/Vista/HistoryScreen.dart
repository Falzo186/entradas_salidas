import 'package:flutter/material.dart';
import 'package:entradas_salidas/Modelo/history_entry.dart';


class HistoryScreen extends StatelessWidget {
  final List<HistoryEntry> historyEntries;

  const HistoryScreen({Key? key, required this.historyEntries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: ListView.builder(
        itemCount: historyEntries.length,
        itemBuilder: (context, index) {
          final entry = historyEntries[index];
          Color tileColor = Colors.white; // Por defecto
          
          // colores según el tipo de entrada
          if (entry.type == 'Entrada') {
            tileColor = Colors.green;
          } else if (entry.type == 'Salida') {
            tileColor = Colors.orange;
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0), 
            child: ListTile(
              title: Text(
                '${entry.type} - ${entry.dateTime}',
                style: const TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
              ),
              tileColor: tileColor, // el color de fondo
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4.0), // espacio entre los elementos
                  Text('Chofer: ${entry.driverName}'),
                  Text('ID del camión: ${entry.truckId}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
