import 'package:entradas_salidas/Controlador/Controlador_ReporteVigilante.dart';
import 'package:entradas_salidas/Modelo/ReporteVigilante.dart';
import 'package:entradas_salidas/Vista/Vista_ObservacionesVigilante.dart';
import 'package:flutter/material.dart';


class HistoryScreen extends StatefulWidget {
  
    const HistoryScreen({super.key, Key });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  controlador_ReporteVigilante controlador = controlador_ReporteVigilante();
  late Future<List<ReporteVigilante>> historial;

  @override
  void initState() {
    super.initState();
    historial = _cargarhistorial();
  }

  Future<List<ReporteVigilante>> _cargarhistorial() async {
    List<ReporteVigilante> listaCamiones = await controlador.obtenerReporteVigilanteEntrada();
    return listaCamiones;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),actions: [
          IconButton(
            icon: const Icon(Icons.note, size: 30),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  vistaObservaciones()),
              );
            },
          ),
        ],
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
      body: FutureBuilder<List<ReporteVigilante>>(
        future: historial,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<ReporteVigilante> historial = snapshot.data ?? [];
            return ListView.builder(
              itemCount: historial.length,
              itemBuilder: (context, index) {
                final entry = historial[index];
                Color tileColor = Colors.white; 
                if (entry.Estado == 'Aceptado') {
                  tileColor = Colors.green;
                } else if (entry.Estado == 'Negado') {
                  tileColor = Colors.red;
                }

                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Detalles del Reporte'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Folio: ${entry.folio}'),
                              Text('Estado: ${entry.Estado}'),
                              Text('Fecha: ${entry.fecha}'),
                              Text('Hora: ${entry.hora}'),
                              Text('Tipo: ${entry.tipo}'),
                              Text('Camión: ${entry.matriculaCamion}'),
                              Text('Vigilante Asignado: ${entry.VigilanteAsignado}'),
                              Text('Motivo: ${entry.Motivo}'),

                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        '${entry.Estado} - ${entry.hora}',
                        style: const TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                      ),
                      tileColor: tileColor, // el color de fondo
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4.0), // espacio entre los elementos
                          Text('Folio: ${entry.folio}'),
                          Text('Tipo: ${entry.tipo}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
