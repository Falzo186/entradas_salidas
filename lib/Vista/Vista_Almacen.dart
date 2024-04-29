import 'package:flutter/material.dart';
import 'dart:math';
import '../Modelo/Almacenobjeto.dart'; 
import 'Vista_EntradaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_SalidaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_ActualizarProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto

class Almacen extends StatefulWidget {
  const Almacen({super.key});

 @override
 _AlmacenState createState() => _AlmacenState();
}

class _AlmacenState extends State<Almacen> {
 List<Almacenobjeto> almacenItems = [];

 // Listas de nombres predefinidos
 List<String> nombresProductos = [
   'Bolsa de Aire',
   'Llantas',
   'Llantas',
   // Agrega más nombres según sea necesario
 ];

 List<String> marcas = [
   'Autofact',
   'Michelin',
   'Bridgestone',
   // Agrega más marcas según sea necesario
 ];

 List<String> categorias = [
   '1s5',
   '159km/hr',
   '210km/hr',
   // Agrega más categorías según sea necesario
 ];

 @override
 void initState() {
    super.initState();
    // Genera objetos de almacén con valores aleatorios
    for (int i = 0; i < nombresProductos.length; i++) {
      almacenItems.add(Almacenobjeto(
        nombre: nombresProductos[i], // Utiliza el nombre del producto de la lista
        folio: Random().nextInt(100),
        cantidad: Random().nextInt(20),
        marca: marcas[i % marcas.length], // Selecciona una marca de la lista
        categoria: categorias[i % categorias.length], // Selecciona una categoría de la lista
      ));
    }
 }

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
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 41, 39, 39)),
                ),
                
                Container(
          width: MediaQuery.of(context).size.width, // Ancho de esquina a esquina
          margin: const EdgeInsets.only(top: 40),
          height: 60, // Altura del rectángulo
          color: Colors.white, // Color del rectángulo
        ),
              ],
              
            ),
            bottomNavigationBar: BottomAppBar(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50,
                top: 5,
                bottom: 20,
              ),
              color: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 41, 39, 39),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.file_upload_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Altas()),
                        );
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.file_download_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bajas()),
                        );
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.edit_note_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actualizar()),
                        );
                },
              ),
            ],
          ),
              ),
            ),
          ),
          const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              'Almacén  Logo aquí',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
          Positioned(
          top: 90, // Ajusta la posición aquí
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
                color: Colors.white,
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