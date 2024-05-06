import 'package:entradas_salidas/Controlador/Controlador_Almacen.dart';
import 'package:entradas_salidas/Modelo/Almacenobjeto.dart';
import 'package:flutter/material.dart';


class Altas extends StatefulWidget {
  const Altas({Key? key}) : super(key: key);

  @override
  State<Altas> createState() => _AltasState();
}

class _AltasState extends State<Altas> {
  ControladorAlmacen controlador = ControladorAlmacen();

  final folioController = TextEditingController();
  final nombreController = TextEditingController();
  final cantidadController = TextEditingController();
  final marcaController = TextEditingController();
  final medicionController = TextEditingController();
  final proveedorController = TextEditingController();

  @override
  void dispose() {
    folioController.dispose();
    nombreController.dispose();
    cantidadController.dispose();
    marcaController.dispose();
    medicionController.dispose();
    proveedorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Altas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Folio",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: folioController,
                decoration: const InputDecoration(
                  labelText: 'Folio',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Nombre",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Cantidad",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: cantidadController,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Marca",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: marcaController,
                decoration: const InputDecoration(
                  labelText: 'Marca',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Medición",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: medicionController,
                decoration: const InputDecoration(
                  labelText: 'Medición',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Proveedor",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: proveedorController,
                decoration: const InputDecoration(
                  labelText: 'Proveedor',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  Almacenobjeto producto = Almacenobjeto(
                    folio: folioController.text,
                    nombre: nombreController.text,
                    cantidad: int.parse(cantidadController.text),
                    marca: marcaController.text,
                    medicion: medicionController.text,
                    proveedor: proveedorController.text,
                  );

                  if (await controlador.agregarProducto(producto)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto agregado correctamente'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error al agregar el producto'),
                      ),
                    );
                  }
                  dispose();
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
