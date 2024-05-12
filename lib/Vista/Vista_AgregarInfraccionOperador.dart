import 'package:entradas_salidas/Controlador/Controlador_HistorialOperador.dart';
import 'package:entradas_salidas/Modelo/InfraccionOperador.dart';
import 'package:entradas_salidas/Modelo/Operador.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VistaAgregarInfraccionOperador extends StatefulWidget {
  final Operador operador;
  final String usuario;
  const VistaAgregarInfraccionOperador({super.key, required this.operador, required this.usuario});

  @override
  State<VistaAgregarInfraccionOperador> createState() => _VistaAgregarInfraccionOperadorState();
}

class _VistaAgregarInfraccionOperadorState extends State<VistaAgregarInfraccionOperador> {
  ControladorHistorialOperador controlador = ControladorHistorialOperador();
  TextEditingController _infraccionController = TextEditingController();
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 15, 58, 47),
                  Color.fromARGB(255, 52, 174, 190),
                ],
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 700,
                      right: 0,
                    ),
                    child: Text(
                      'Agregar Infracción',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                ),
              ),
              child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.0,
            alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 137, 141),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0), // Añade espaciado a los lados
            child: const Text(
              'Infracción',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
            TextField(
            controller: _infraccionController,
            decoration: const InputDecoration(
              labelText: 'Ingrese la descripción de la infracción',
              border: OutlineInputBorder(),
            ),
            maxLines: 10,
            ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                 InfraccionOperador infraccionOperador = InfraccionOperador(
                    idChofer: widget.operador.IdChofer,
                    Infraccion: _infraccionController.text,
                    fecha: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    encargado: widget.usuario,
                  );
                  controlador.agregarInfraccionOperador(infraccionOperador);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.black, 
                  fixedSize: const Size(120, 50),
                ),
                child: const Text(
                  'Agregar',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
            ),
          ),
        ],
      ),
    );
  }

}