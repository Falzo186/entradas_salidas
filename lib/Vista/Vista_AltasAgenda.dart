import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VistaAltaAgenda extends StatefulWidget {
  @override
  _VistaAltaAgendaState createState() => _VistaAltaAgendaState();
}

class _VistaAltaAgendaState extends State<VistaAltaAgenda> {
  late DateTime _fechaHoraSeleccionada = DateTime(2021, 10, 10, 10, 10); // valor por defecto
  late String _tipoSeleccionado = 'Entrada'; // valor por defecto

  final _folioController = TextEditingController();
  final _matriculaCamionController = TextEditingController();
  final _nombreOperadorController = TextEditingController();
  final _tipoDeCargaController = TextEditingController();
  final _pesoCargaController = TextEditingController();
  final _destinoCargaController = TextEditingController();

  Future<void> _seleccionarFechaHora(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (fechaSeleccionada != null) {
      final TimeOfDay? horaSeleccionada = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (horaSeleccionada != null) {
        setState(() {
          _fechaHoraSeleccionada = DateTime(
            fechaSeleccionada.year,
            fechaSeleccionada.month,
            fechaSeleccionada.day,
            horaSeleccionada.hour,
            horaSeleccionada.minute,
          );
        });
      }
    }
  }

  void _agregarAgenda() async {
    try {
      await FirebaseFirestore.instance.collection('Agendas').add({
        'folio': _folioController.text,
        'matriculaCamion': _matriculaCamionController.text,
        'nombreOperador': _nombreOperadorController.text,
        'fecha': _fechaHoraSeleccionada,
        'tipo': _tipoSeleccionado,
        'tipodeCarga': _tipoDeCargaController.text,
        'pesoCarga': _pesoCargaController.text,
        'destinoCarga': _destinoCargaController.text,
      });
      print('Agenda agregada a Firestore correctamente');
    } catch (e) {
      print('Error al agregar agenda a Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Agenda'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              Text('Fecha y Hora Seleccionada: $_fechaHoraSeleccionada'),
              ElevatedButton(
                onPressed: () => _seleccionarFechaHora(context),
                child: const Text('Seleccionar Fecha y Hora'),
              ),
              DropdownButton<String>(
                value: _tipoSeleccionado,
                onChanged: (String? newValue) {
                  setState(() {
                    _tipoSeleccionado = newValue!;
                  });
                },
                items: <String>['Entrada', 'Salida'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: _tipoDeCargaController,
                decoration: const InputDecoration(labelText: 'Tipo de Carga'),
              ),
              TextField(
                controller: _pesoCargaController,
                decoration: const InputDecoration(labelText: 'Peso de la Carga'),
              ),
              TextField(
                controller: _destinoCargaController,
                decoration: const InputDecoration(labelText: 'Destino de la Carga'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _agregarAgenda,
                child: const Text('Agregar Agenda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}