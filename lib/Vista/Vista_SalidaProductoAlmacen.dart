import 'package:entradas_salidas/Controlador/Controlador_Almacen.dart';
import 'package:flutter/material.dart';



class Bajas extends StatefulWidget {
  final String usuario;
  const Bajas({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Bajas> createState() => _BajasState();
}

class _BajasState extends State<Bajas> {
  ControladorAlmacen controlador = ControladorAlmacen();

  final folioController = TextEditingController();
  final cantidadController = TextEditingController();
  final usuarioController = TextEditingController();

  @override
  void dispose() {
    folioController.clear();
    cantidadController.clear();
    usuarioController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bajas', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253), 
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
                "Cantidad",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: cantidadController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese cantidad',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Usuario Despachado",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese usuario Despachado',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final folio = folioController.text;
                  final cantidad = int.parse(cantidadController.text);
                  final usuario = usuarioController.text;
                  if(await controlador.eliminarProducto(folio, cantidad, usuario, widget.usuario)){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto eliminado correctamente'),
                      ),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error al eliminar el producto'),
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
