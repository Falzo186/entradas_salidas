import 'package:entradas_salidas/Controlador/Controlador_camiones.dart';
import 'package:entradas_salidas/Modelo/Camion.dart';
import 'package:flutter/material.dart';

class AltaCamionView extends StatefulWidget {
  const AltaCamionView({super.key});

  @override
  _AltaCamionViewState createState() => _AltaCamionViewState();
}

class _AltaCamionViewState extends State<AltaCamionView> {
  ControladorCamiones _controlador = ControladorCamiones();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _companiaController = TextEditingController();
  final TextEditingController _kilometrajeController = TextEditingController();
  DateTime _ultimoServicio = DateTime.now();
  DateTime _proximoServicio = DateTime.now();
  String ultimoServicio = '';
  String proximoServicio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta de Camión'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(labelText: 'Matrícula'),
            ),
            TextField(
              controller: _modeloController,
              decoration: const InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _anoController,
              decoration: const InputDecoration(labelText: 'Año de Fabricación'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _companiaController,
              decoration: const InputDecoration(labelText: 'Compañía de Transporte'),
            ),
            TextField(
              controller: _kilometrajeController,
              decoration: const InputDecoration(labelText: 'Kilometraje'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            Text('Último Servicio: ${_formatDate(_ultimoServicio)}'),
            ElevatedButton(
              onPressed: () {
                _selectDate(context, _ultimoServicio).then((value) {
                  if (value != null) {
                    setState(() {
                      _ultimoServicio = value;
                    });
                  }
                });
              },
              child: const Text('Seleccionar Último Servicio'),
            ),
            const SizedBox(height: 20.0),
            Text('Próximo Servicio: ${_formatDate(_proximoServicio)}'),
            ElevatedButton(
              onPressed: () {
                _selectDate(context, _proximoServicio).then((value) {
                  if (value != null) {
                    setState(() {
                      _proximoServicio = value;
                    });
                  }
                });
              },
              child: const Text('Seleccionar Próximo Servicio'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                Camion camion = Camion(
                  matricula: _matriculaController.text,
                  modelo: _modeloController.text,
                  anoFabricacion: int.parse(_anoController.text),
                  companiaTransporte: _companiaController.text,
                  kilometraje: int.parse(_kilometrajeController.text),
                  ultimoServicio: _formatDate(_ultimoServicio),
                  proximoServicio: _formatDate(_proximoServicio),
                  historialCargas: int.parse(_matriculaController.text),
                );
                bool registrado = await _controlador.registrarCamion(camion);
                // if (registrado) {
                //   Navigator.pop(context);
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Ya existe un camión con esa matrícula'),
                //     ),
                //   );
                // }
              },
              child: const Text('Guardar Camión'),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initialDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    return pickedDate;
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  
}