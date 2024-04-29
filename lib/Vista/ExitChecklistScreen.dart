import 'package:flutter/material.dart';

class ExitChecklistScreen extends StatefulWidget {
  const ExitChecklistScreen({super.key});

  
  @override
  _ExitChecklistScreenState createState() => _ExitChecklistScreenState();
}

class _ExitChecklistScreenState extends State<ExitChecklistScreen> {
  bool tiresChecked = false;
  bool brakesChecked = false;
  bool lightsChecked = false;
  bool fluidsChecked = false;
  bool hornChecked = false;
  bool mirrorsChecked = false;
  bool paperworkChecked = false;
  bool fuelChecked = false;
  bool cargoChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: const Text('SALIDA CHECKLIST'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Elementos:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text('Neumáticos revisados'),
                value: tiresChecked,
                onChanged: (bool? value) {
                  setState(() {
                    tiresChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Frenos revisados'),
                value: brakesChecked,
                onChanged: (bool? value) {
                  setState(() {
                    brakesChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Luces revisadas'),
                value: lightsChecked,
                onChanged: (bool? value) {
                  setState(() {
                    lightsChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Fluidos revisados'),
                value: fluidsChecked,
                onChanged: (bool? value) {
                  setState(() {
                    fluidsChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Claxon revisado'),
                value: hornChecked,
                onChanged: (bool? value) {
                  setState(() {
                    hornChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Espejos revisados'),
                value: mirrorsChecked,
                onChanged: (bool? value) {
                  setState(() {
                    mirrorsChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Documentación verificada'),
                value: paperworkChecked,
                onChanged: (bool? value) {
                  setState(() {
                    paperworkChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Combustible verificado'),
                value: fuelChecked,
                onChanged: (bool? value) {
                  setState(() {
                    fuelChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Carga verificada'),
                value: cargoChecked,
                onChanged: (bool? value) {
                  setState(() {
                    cargoChecked = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text('Nombre del Chofer:'),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre del Chofer',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text('ID del Camión:'),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'ID del Camión',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text('Observaciones:'),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Observaciones',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Acción para guardar la salida
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Bordes rectangulares
                  ),
                ),
                child: const Text('Guardar salida'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}