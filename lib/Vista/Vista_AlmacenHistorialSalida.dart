import 'package:flutter/material.dart';

class HistorialSalida extends StatelessWidget {
  const HistorialSalida({super.key});

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
                child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              'Historial de Saida Logo aquí',
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