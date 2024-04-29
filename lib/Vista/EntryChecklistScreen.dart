import 'package:flutter/material.dart';

class EntryChecklistScreen extends StatefulWidget {
  const EntryChecklistScreen({super.key});

  @override
  _EntryChecklistScreenState createState() => _EntryChecklistScreenState();
}

class _EntryChecklistScreenState extends State<EntryChecklistScreen> {
  bool tiresChecked = false;
  bool brakesChecked = false;
  bool lightsChecked = false;
  bool fluidsChecked = false;
  bool hornChecked = false;
  bool mirrorsChecked = false;
  bool seatbeltsChecked = false;
  bool wipersChecked = false;
  bool emergencyKitChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ENTRADA CHECKLIST'),
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
                title: const Text('Cinturones de seguridad revisados'),
                value: seatbeltsChecked,
                onChanged: (bool? value) {
                  setState(() {
                    seatbeltsChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Limpiaparabrisas revisados'),
                value: wipersChecked,
                onChanged: (bool? value) {
                  setState(() {
                    wipersChecked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Kit de emergencia revisado'),
                value: emergencyKitChecked,
                onChanged: (bool? value) {
                  setState(() {
                    emergencyKitChecked = value ?? false;
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
              const SizedBox(height: 8),
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
                  // Acción para guardar la entrada
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Bordes rectangulares
                  ),
                ),
                child: const Text('Guardar entrada'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
