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
    folioController.clear();
    nombreController.clear();
    cantidadController.clear();
    marcaController.clear();
    medicionController.clear();
    proveedorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Altas', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253), 
        fontSize: 25)),
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
                  labelText: 'Ingrese folio',
                  border: OutlineInputBorder(),
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
                  labelText: 'Ingrese nombre del producto',
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
                  labelText: 'Ingrese la cantidad',
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
                  labelText: 'Ingrese marca',
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
                  labelText: 'Ingrese la medida',
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
                  labelText: 'Ingrese el proveedor',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),
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
                foregroundColor: Colors.white, 
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
                child: const Text(
                  'Agregar',
                  style: TextStyle(
                    fontSize: 15),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
