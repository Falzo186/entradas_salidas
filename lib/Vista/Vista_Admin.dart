import 'package:entradas_salidas/Vista/Vista_AltasAgenda.dart';
import 'package:entradas_salidas/Vista/Vista_GestionUsuarios.dart';
import 'package:entradas_salidas/Vista/Vista_MenuAlmacen.dart';
import 'package:entradas_salidas/Vista/Vista_MenuVigilante.dart';
import 'package:flutter/material.dart';

class VistaAdmin extends StatefulWidget {
  final String usuario;
  const VistaAdmin({Key? key, required this.usuario}) : super(key: key);

  @override
  State<VistaAdmin> createState() => _VistaAdminState();
}

class _VistaAdminState extends State<VistaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      bottom: 160,
                      right: 0,
                    ),
                    child: Text(
                      'Panel de Administración',
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: OutlinedButton(
                          onPressed: () {
                            // Acción para el botón "Almacen"
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => Inicio(usuario: widget.usuario),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(color: Colors.grey),
                            backgroundColor: Colors.grey[100],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.store,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Almacen',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => MenuVigilante(usuario: widget.usuario),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(color: Colors.grey),
                            backgroundColor: Colors.grey[100],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_shipping,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Vigilante',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => VistaAltaAgenda(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(color: Colors.grey),
                            backgroundColor: Colors.grey[100],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                              child: Row(
                                children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: Text(
                                  'Gestionar Agenda',
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                  overflow: TextOverflow.visible,
                                  ),
                                ),
                                ],
                              ),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => VistaGestionUsuario(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(color: Colors.grey),
                            backgroundColor: Colors.grey[100],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                              child: Row(
                                children: [
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: Text(
                                  'Gestionar Usuarios',
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                  overflow: TextOverflow.visible,
                                  ),
                                ),
                                ],
                              ),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 155,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
                color: Colors.black, // Color de fondo blanco
              ),
              child: IconButton(
                icon: const Icon(Icons.exit_to_app, size: 30, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

