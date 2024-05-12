import 'package:entradas_salidas/Vista/Vista_ConsultaAlmacen.dart';
import 'package:flutter/material.dart';
import 'Vista_Almacen.dart'; 
import 'Vista_AlmacenReportes.dart';

class Inicio extends StatefulWidget {
  final String usuario;
  const Inicio({super.key, required this.usuario});

  @override
  _InicioState createState() => _InicioState();
}


class _InicioState extends State<Inicio> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.40,
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
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 155,
                    left: 150,
                  ),
                  child: Text(
                    'Menú\n                Almacen',
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
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 100,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: MediaQuery.of(context).size.height * 0.27,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Almacen(usuario: widget.usuario)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(color: Colors.grey),
                            
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.store,
                                size: 70,
                                color: Colors.black,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Almacén',
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: MediaQuery.of(context).size.height * 0.27,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const VistaReportes()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(color: Colors.grey)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.receipt_long,
                                size: 70,
                                color: Colors.black,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Reportes',
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
  width: MediaQuery.of(context).size.width * 0.43,
  height: MediaQuery.of(context).size.height * 0.27,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VistaConsultas()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: const BorderSide(color: Colors.grey),
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Icon(
          Icons.search,
          size: 70,
          color: Colors.black,
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Catálogo de \n Productos',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    ),
  ),
),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 110,
          right: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
              color: Colors.black, // Color de fondo blanco
            ),
            child: IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top - 55,
          left: 0,
          child: Container(
            decoration: const BoxDecoration(),
            child: Image.asset(
              'lib/assets/camion.png', // Ruta de la imagen
              width: 250, // Ancho de la imagen
              height: 200, // Alto de la imagen
            ),
          ),
        ),
      ],
    ),
  );
}
}