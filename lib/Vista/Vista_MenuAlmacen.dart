// Inicio.dart
import 'package:flutter/material.dart';
import 'Vista_Almacen.dart'; 
import 'Vista_AlmacenReportes.dart';
import 'Vista_AlmacenFacturas.dart';
import 'Vista_AlmacenHistorialSalida.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

 @override
 _InicioState createState() => _InicioState();
}
class _InicioState extends State<Inicio> {
 @override
Widget build(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 41, 39, 39), // Color negro
        elevation: 0, // Sin sombra debajo del AppBar
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 243, 238, 238),
      ),
    ),
    child: Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromARGB(255, 243, 238, 238),
          appBar: AppBar(
             actions: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0,top: 15), // Ajusta el espacio entre el ícono y el borde derecho del AppBar
                child: IconButton(
                  icon: const Icon(Icons.exit_to_app,size: 35,color: Colors.white,), 
                  onPressed: () {
                    // Aquí va la lógica para salir de la aplicación
                  },
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 41, 39, 39)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4, // Ancho del botón
                            height: MediaQuery.of(context).size.width * 0.4, // Alto del botón
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Almacen()),
                                ); // Lógica del botón
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Cambiar color de fondo aquí
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Hazlos cuadrados aquí
                                ),
                              ),
                              child: const Text('Almacen',style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4, // Ancho del botón
                            height: MediaQuery.of(context).size.width * 0.4, // Alto del botón
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Facturas()),
                                ); // Lógica del botón
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Cambiar color de fondo aquí
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Hazlos cuadrados aquí
                                ),
                              ),
                              child: const Text('Facturas',style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4, // Ancho del botón
                            height: MediaQuery.of(context).size.width * 0.4, // Alto del botón
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HistorialSalida()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Cambiar color de fondo aquí
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Hazlos cuadrados aquí
                                ),
                              ),
                              child: const Text('Historial de salida',style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4, // Ancho del botón
                            height: MediaQuery.of(context).size.width * 0.4, // Alto del botón
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Bitacora()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Cambiar color de fondo aquí
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Hazlos cuadrados aquí
                                ),
                              ),
                              child: const Text('Reportes',style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 150, // Ajusta la posición aquí
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 70, 209, 191),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}