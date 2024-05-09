import 'package:flutter/material.dart';
import 'package:entradas_salidas/Vista/EntryChecklistScreen.dart';
import 'package:entradas_salidas/Vista/ExitChecklistScreen.dart';
import '../Modelo/Camion.dart';

class VistaDetallesCamion extends StatefulWidget {
  final Camion camion;

  const VistaDetallesCamion({required this.camion, Key? key}) : super(key: key);

  @override
  _VistaDetallesCamionState createState() => _VistaDetallesCamionState();
}

class _VistaDetallesCamionState extends State<VistaDetallesCamion> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 41, 39, 39), 
          elevation: 0, 
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 243, 238, 238),
        ),
      ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 238, 238),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 41, 39, 39),
                    ),
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
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20), 
                                child: Container(
                                  alignment: AlignmentDirectional
                                      .centerEnd, 
                                  child: const Text(
                                    'Ultimo servicio',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20), 
                                child: Container(
                                  alignment: AlignmentDirectional
                                      .centerStart, 
                                  child: const Text(
                                    'Proximo servicio',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 170,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text('Container 1'),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              width: 170,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text('Container 2'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Positioned(
                          top: 200, // Ajusta la posición aquí
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: Container(
                              height: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Positioned(
                          top: 150, // Ajusta la posición aquí
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      icon: const Icon(Icons.offline_pin_outlined, size: 40),
                      color: Colors.white,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const EntryChecklistScreen(),
                        //   ),
                        // );
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.edit_note_outlined, size: 40),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.arrow_circle_right_outlined, size: 40),
                      color: Colors.white,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ExitChecklistScreen(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 90, 
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
              ),
              child: Container(
                height: 100,
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