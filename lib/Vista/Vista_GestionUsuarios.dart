import 'package:entradas_salidas/Controlador/Controlador_Login.dart';
import 'package:entradas_salidas/Modelo/Usuario.dart';
import 'package:entradas_salidas/Vista/Vista_registrar.dart';
import 'package:flutter/material.dart';

class VistaGestionUsuario extends StatefulWidget {
  const VistaGestionUsuario({super.key});

  @override
  State<VistaGestionUsuario> createState() => _VistaGestionUsuarioState();
}

class _VistaGestionUsuarioState extends State<VistaGestionUsuario> {
  List<Usuario> usuarios = [];
  final ControladorLogin controlador = ControladorLogin();
  
  @override
  void initState() {
    super.initState();
    _cargarUsuarios();
  }

  Future<void> _cargarUsuarios() async {
    List<Usuario> listaUsuarios = await controlador.getUsuariosFromFirebase();
    setState(() {
      usuarios = listaUsuarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 15, 58, 47),
                    Color.fromARGB(255, 52, 174, 190),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: usuarios
                      .map((usuario) => Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Nombre')),
                                DataColumn(label: Text('Tipo de Usuario')),
                                DataColumn(label: Text('Contraseña')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text(usuario.nombre)),
                                  DataCell(Text(usuario.tipoUsuario)),
                                  DataCell(Text(usuario.contrasena)),
                                ]),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 15, 58, 47),
                  Color.fromARGB(255, 52, 174, 190),
                ],
              ),
            ),
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Usuarios',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add_outlined, size: 30),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistroUsuarios()),
                    );
                  },
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}
