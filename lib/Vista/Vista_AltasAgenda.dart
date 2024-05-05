import 'package:entradas_salidas/Controlador/Controlador_Agenda.dart';
import 'package:entradas_salidas/Modelo/Agenda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class VistaAltaAgenda extends StatefulWidget {
  
  VistaAltaAgenda({super.key});

  @override
  _VistaAltaAgendaState createState() => _VistaAltaAgendaState();
}

class _VistaAltaAgendaState extends State<VistaAltaAgenda> {
  final _formKey = GlobalKey<FormState>();
  late String _folio;
  late String _matriculaCamion;
  late String _nombreOperador;
  late String _fecha;
  late String _hora;
  late String _tipodeCarga;
  late String _pesoCarga;
  late String _destinoCarga;
  ControaldorAgenda controladorAgenda = ControaldorAgenda();

  List<String> _tiposCarga = ['Entrada', 'Salida'];
  String? _selectedTipoCarga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Agenda')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Folio'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el folio';
                  }
                  return null;
                },
                onSaved: (value) => _folio = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Matrícula del Camión'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la matrícula del camión';
                  }
                  return null;
                },
                onSaved: (value) => _matriculaCamion = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre del Operador'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre del operador';
                  }
                  return null;
                },
                onSaved: (value) => _nombreOperador = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Fecha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la fecha';
                  }
                  return null;
                },
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() {
                        _fecha = date.toString();
                      });
                    },
                    currentTime: DateTime.now(),
                  );
                },
                readOnly: true,
                controller: TextEditingController(text: _fecha),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Hora'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la hora';
                  }
                  return null;
                },
                onTap: () {
                  DatePicker.showTimePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (time) {
                      setState(() {
                        _hora = time.toString();
                      });
                    },
                    currentTime: DateTime.now(),
                  );
                },
                readOnly: true,
                controller: TextEditingController(text: _hora),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Tipo de Carga'),
                value: _selectedTipoCarga,
                items: _tiposCarga.map((String tipo) {
                  return DropdownMenuItem<String>(
                    value: tipo,
                    child: Text(tipo),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedTipoCarga = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona el tipo de carga';
                  }
                  return null;
                },
                onSaved: (value) => _tipodeCarga = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Peso de Carga'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el peso de carga';
                  }
                  return null;
                },
                onSaved: (value) => _pesoCarga = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Destino de Carga'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el destino de carga';
                  }
                  return null;
                },
                onSaved: (value) => _destinoCarga = value!,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Agenda nuevaAgenda = Agenda(
                      folio: _folio,
                      matriculaCamion: _matriculaCamion,
                      nombreOperador: _nombreOperador,
                      fecha: _fecha,
                      hora: _hora,
                      tipo: _selectedTipoCarga!,
                      tipodeCarga: _tipodeCarga,
                      pesoCarga: _pesoCarga,
                      destinoCarga: _destinoCarga,
                    );
                    bool registro = await controladorAgenda.agregarAgenda(nuevaAgenda);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Agregar Agenda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
          