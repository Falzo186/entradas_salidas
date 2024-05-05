import 'package:entradas_salidas/Vista/Vista_AltasAgenda.dart';
import 'package:entradas_salidas/Vista/Vista_GestionUsuarios.dart';
import 'package:entradas_salidas/Vista/Vista_MenuAlmacen.dart';
import 'package:entradas_salidas/Vista/Vista_MenuVigilante.dart';
import 'package:flutter/material.dart';

class VistaAdmin extends StatefulWidget {
  @override
  State<VistaAdmin> createState() => _VistaAdminState();
}

class _VistaAdminState extends State<VistaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panel de Administración'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Acción para el botón "Almacen"
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => const Inicio(),
                                ),
                              );
              },
              child: Text('Almacen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción para el botón "Vigilante"
                 Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => MenuVigilante(),
                              ),
                            );
               
              },
              child: Text('Vigilante'),
            ),
            ElevatedButton(
              onPressed: () {
                 // Acción para el botón "Gestionar Entradas"
                Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => VistaAltaAgenda(),
                                ),
                              );
                 
              },
              child: Text('Gestionar Agenda'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción para el botón "Gestionar Usuarios"
                Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) =>  VistaGestionUsuario(),
                                ),
                              );
              },
              child: Text('Gestionar Usuarios'),
            ),
          ],
        ),
      ),
    );
  }
}
