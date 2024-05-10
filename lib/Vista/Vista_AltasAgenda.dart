import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VistaAltaAgenda extends StatefulWidget {
  const VistaAltaAgenda({Key? key}) : super(key: key);

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
        title: const Text('Agregar Agenda', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Folio:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _folioController, // Asignar el controlador
                decoration: InputDecoration(
                  hintText: 'Ingrese folio',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Matrícula del Camión:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _matriculaCamionController, // Asignar el controlador
                decoration: InputDecoration(
                  hintText: 'Ingrese la matrícula del camión',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nombre del Operador:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _nombreOperadorController, // Asignar el controlador
                decoration: InputDecoration(
                  hintText: 'Ingrese el nombre del operador',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text('Fecha y Hora Seleccionada: $_fechaHoraSeleccionada'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _seleccionarFechaHora(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
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
              const SizedBox(height: 10.0),
              TextField(
                controller: _tipoDeCargaController, // Asignar el controlador
                decoration: const InputDecoration(
                  hintText: 'Tipo de Carga',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _pesoCargaController, // Asignar el controlador
                decoration: const InputDecoration(
                  hintText: 'Peso de Carga',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _destinoCargaController, // Asignar el controlador
                decoration: const InputDecoration(
                  hintText: 'Destino de Carga',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _agregarAgenda,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
                child: const Text('Agregar Agenda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}