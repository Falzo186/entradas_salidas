
import 'package:entradas_salidas/Controlador/Controlador_Operador.dart';
import 'package:entradas_salidas/Modelo/Operador.dart';
import 'package:flutter/material.dart';

class VistaAltasOperadores extends StatefulWidget {
  @override
  _VistaAltasOperadoresState createState() => _VistaAltasOperadoresState();
}

class _VistaAltasOperadoresState extends State<VistaAltasOperadores> {
  final TextEditingController _idChoferController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _licenciaController = TextEditingController();
  final TextEditingController _contactoController = TextEditingController();
  final TextEditingController _estadoSaludController = TextEditingController();
  final ControladorOperador controlador = ControladorOperador();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Altas de Operadores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _idChoferController,
              decoration: const InputDecoration(labelText: 'ID del Chofer'),
            ),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _licenciaController,
              decoration: const InputDecoration(labelText: 'Licencia de Conducir'),
            ),
            TextField(
              controller: _contactoController,
              decoration: const InputDecoration(labelText: 'Contacto'),
            ),
            TextField(
              controller: _estadoSaludController,
              decoration: const InputDecoration(labelText: 'Estado de Salud'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
               
              Operador operador = Operador(
                IdChofer: _idChoferController.text,
                nombre: _nombreController.text,
                licenciaConducir: _licenciaController.text,
                contacto: _contactoController.text,
                estadoSalud: _estadoSaludController.text,
              );
              bool registrar = await controlador.registrarOperador(operador);
              

              },
              child: const Text('Agregar Operador'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _idChoferController.dispose();
    _nombreController.dispose();
    _licenciaController.dispose();
    _contactoController.dispose();
    _estadoSaludController.dispose();
    super.dispose();
  }
}