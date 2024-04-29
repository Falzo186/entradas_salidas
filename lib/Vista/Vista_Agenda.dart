import 'package:entradas_salidas/Vista/Vista_DetalleEntradaCamion.dart';
import 'package:entradas_salidas/Vista/Vista_DetallesSalidaCamiones.dart';
import 'package:flutter/material.dart';

import '../Modelo/EntradaCamiones.dart';
import '../Modelo/SalidaCamiones.dart';

class VistaAgenda extends StatelessWidget {

  final List<EntradaCamiones> entradasProgramadas = [
    EntradaCamiones(
      matriculaCamion: 'XXXX-XXX',
      horaEntrada: '08:00',
      tipodeCarga: 'Carga de prueba',
      pesoCarga: '1000 kg',
      destinoCarga: 'Destino de prueba',
      nombreConductor: 'Conductor de prueba',
    ),
    EntradaCamiones(
      matriculaCamion: 'YYYY-YYY',
      horaEntrada: '10:00',
      tipodeCarga: 'Carga de prueba',
      pesoCarga: '1000 kg',
      destinoCarga: 'Destino de prueba',
      nombreConductor: 'Conductor de prueba',
    ),
  ];

  final List<SalidaCamiones> salidasProgramadas = [
    SalidaCamiones(
      matriculaCamion: 'ZZZZ-ZZZ',
      horaSalida: '12:00',
      tipodeCarga: 'Carga de prueba',
      pesoCarga: '1000 kg',
      destinoCarga: 'Destino de prueba',
      nombreConductor: 'Conductor de prueba',
    ),
    SalidaCamiones(
      matriculaCamion: 'WWWW-WWW',
      horaSalida: '14:00',
      tipodeCarga: 'Carga de prueba',
      pesoCarga: '1000 kg',
      destinoCarga: 'Destino de prueba',
      nombreConductor: 'Conductor de prueba',
    ),
  ];

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Entradas Programadas (${entradasProgramadas.length}):'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entradasProgramadas.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Camión: ${entradasProgramadas[index].matriculaCamion}'),
                      subtitle: Text('Hora de Entrada: ${entradasProgramadas[index].horaEntrada}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleEntradaCamion(entrada: entradasProgramadas[index]),
                          ),
                        );
                      },
                    ),
                   
                  ],
                );
              },
            ),
          ),
          ListTile(
            title: Text('Salidas Programadas (${salidasProgramadas.length}):'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: salidasProgramadas.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Camión: ${salidasProgramadas[index].matriculaCamion}'),
                      subtitle: Text('Hora de Salida: ${salidasProgramadas[index].horaSalida}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleSalidaCamion(salida: salidasProgramadas[index]),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
