
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
        title: const Text('Vista de Chofer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Nombre del Operador:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el nombre del operador',
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese la matrícula del camión',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Licencia:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Ingrese la licencia',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estado:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Ingrese el estado de la licencia',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Contacto:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el contacto del chofer',
                  border: OutlineInputBorder(),
                ),
              ),
              
              const SizedBox(height: 20),
              // Botón "ACEPTAR"
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () async {
                      
                      

                      // Verificar si se cumple la condición
                      if (await controlador.registrarOperador( Operador(
                      IdChofer: _idChoferController.text,
                      nombre: _nombreController.text,
                      licenciaConducir: _licenciaController.text,
                      contacto: _contactoController.text,
                      estadoSalud: _estadoSaludController.text,
                      ))) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('EXITO!'),
                          content: const Text('El operador ha sido registrado correctamente!'),
                          actions: [
                          TextButton(
                            child: const Text('Aceptar'),
                            onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            },
                          ),
                          ],
                        );
                        },
                      );
                      }
                    },
                  style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
              child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void clear() {
    _idChoferController.clear();
    _nombreController.clear();
    _licenciaController.clear();
    _contactoController.clear();
    _estadoSaludController.clear();
  }
}