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
          backgroundColor: Color.fromARGB(255, 41, 39, 39),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 243, 238, 238),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(243, 238, 238, 1),
        appBar: AppBar(
          toolbarHeight: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 15),
              child: IconButton(
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.15,
                    height: 100,
                    // color: Colors.ransparent,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 41, 39, 39)),
                  ),
                  Positioned(
                    bottom: -35,
                    child: Container(
                      height: 70,
                      width: 425,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 70, 209, 191),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 324,
                            child: TextField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Almacen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Almacen',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Facturas()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Facturas',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HistorialSalida()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Historial de salida',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  VistaReportes()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Reportes',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
      // Positioned(
      //   top: 100,
      //   left: 0,
      //   right: 0,
      //   child: Padding(
      //     padding: const EdgeInsets.only(
      //       left: 25.0,
      //       right: 25.0,
      //     ),
      //     child: Container(
      //       height: 70,
      //       decoration: BoxDecoration(
      //         color: const Color.fromARGB(255, 70, 209, 191),
      //         borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Row(
      //           children: [
      //             const Spacer(),
      //             Padding(
      //               padding: const EdgeInsets.only(right: 30.0),
      //               child: IconButton(
      //                 icon: const Icon(Icons.search, color: Colors.white,size: 30,),
      //                 onPressed: () {
      //                },
      //               ),
      //             ),
      //            ],
      //           ),
      //         ),
      //       ),
      //     ),
    );
  }
}