
import 'package:entradas_salidas/Controlador/Controlador_Agenda.dart';
import 'package:entradas_salidas/Modelo/Agenda.dart';
import 'package:flutter/material.dart';


class VistaAltaAgenda extends StatefulWidget {
  
  VistaAltaAgenda({super.key});

  @override
  _VistaAltaAgendaState createState() => _VistaAltaAgendaState();
}

class _VistaAltaAgendaState extends State<VistaAltaAgenda> {
  ControladorAgenda _controlador = ControladorAgenda();
  final TextEditingController _folioController = TextEditingController();
  final TextEditingController _matriculaCamionController = TextEditingController();
  final TextEditingController _nombreOperadorController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tipodeCargaController = TextEditingController();
  final TextEditingController _pesoCargaController = TextEditingController();
  final TextEditingController _destinoCargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Agenda'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _folioController,
              decoration: const InputDecoration(labelText: 'Folio'),
            ),
            TextField(
              controller: _matriculaCamionController,
              decoration: const InputDecoration(labelText: 'Matrícula del Camión'),
            ),
            TextField(
              controller: _nombreOperadorController,
              decoration: const InputDecoration(labelText: 'Nombre del Operador'),
            ),
            TextField(
              controller: _fechaController,
              decoration: const InputDecoration(labelText: 'Fecha'),
            ),
            TextField(
              controller: _horaController,
              decoration: const InputDecoration(labelText: 'Hora'),
            ),
            TextField(
              controller: _tipoController,
              decoration: const InputDecoration(labelText: 'Tipo'),
            ),
            TextField(
              controller: _tipodeCargaController,
              decoration: const InputDecoration(labelText: 'Tipo de Carga'),
            ),
            TextField(
              controller: _pesoCargaController,
              decoration: const InputDecoration(labelText: 'Peso de Carga'),
            ),
            TextField(
              controller: _destinoCargaController,
              decoration: const InputDecoration(labelText: 'Destino de Carga'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Agenda agenda = Agenda(
                  folio: _folioController.text,
                  matriculaCamion: _matriculaCamionController.text,
                  nombreOperador: _nombreOperadorController.text,
                  fecha : _fechaController.text,
                  hora: _horaController.text,
                  tipo: _tipoController.text,
                  tipodeCarga: _tipodeCargaController.text,
                  pesoCarga: _pesoCargaController.text,
                  destinoCarga: _destinoCargaController.text,
                );    
                _controlador.agregarAgenda(agenda).then((value) {
                  if (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Agenda agregada correctamente')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error al agregar la agenda')),
                    );
                  }
                });
              },
              child: const Text('Guardar Agenda'),
            ),
          ],

        ),
      ),
    );
  }
}
