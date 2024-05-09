import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CapturaFechaHora extends StatefulWidget {
  @override
  _CapturaFechaHoraState createState() => _CapturaFechaHoraState();
}

class _CapturaFechaHoraState extends State<CapturaFechaHora> {
  late DateTime _fechaHoraSeleccionada=DateTime(2021, 10, 10, 10, 10);

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

        // Subir la fecha y hora seleccionada a Firestore
        try {
          await FirebaseFirestore.instance.collection('Agendas').add({
            'fechaHora': _fechaHoraSeleccionada,
          });
          print('Fecha y hora subida a Firestore correctamente');
        } catch (e) {
          print('Error al subir fecha y hora a Firestore: $e');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capturar Fecha y Hora'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _fechaHoraSeleccionada != null
                ? Text('Fecha y hora seleccionada: $_fechaHoraSeleccionada')
                : Text('Fecha y hora aún no seleccionada'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _seleccionarFechaHora(context),
              child: Text('Seleccionar Fecha y Hora'),
            ),
          ],
        ),
      ),
    );
  }
}