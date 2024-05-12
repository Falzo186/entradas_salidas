import 'package:entradas_salidas/Controlador/Controlador_Login.dart';
import 'package:entradas_salidas/Controlador/Controlador_RegistrarUsuario.dart';
import 'package:flutter/material.dart';
import 'package:entradas_salidas/Modelo/Usuario.dart';

class RegistroUsuarios extends StatefulWidget {
  const RegistroUsuarios({Key? key}) : super(key: key);

  @override
  _RegistroUsuariosState createState() => _RegistroUsuariosState();
}

class _RegistroUsuariosState extends State<RegistroUsuarios> {
  String nombre = '';
  String contrasena = '';
  String matricula = '';
  String? tipoUsuario; // Cambiado a String nulable
  bool esAdmin = false;
  bool adminValido = false;
  final Controlador_RegistrarUsuario _controlador = Controlador_RegistrarUsuario();

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
                      bottom: 650,
                      right: 0,
                    ),
                    child: Text(
                      'Registrar Usuarios',
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
              child: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 32, right: 32, bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Ingrese los datos del nuevo usuario:'),
                        const SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                'Usuario',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      matricula = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                'Contraseña',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      contrasena = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.0,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: DropdownButtonFormField<String>(
                              value: tipoUsuario,
                              items: ['Almacenista', 'Vigilante', 'Admin']
                                  .map((label) => DropdownMenuItem(
                                        value: label,
                                        child: Text(label,
                                            style: const TextStyle(
                                                color: Colors.black)),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  tipoUsuario = value;
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'Tipo de Usuario',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 13),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () async {
                                bool registrado = await _controlador.registrarUsuario(Usuario(
                                  nombre: matricula,
                                  contrasena: contrasena,
                                  matricula: matricula,
                                  tipoUsuario: tipoUsuario ?? '', // Usar el valor seleccionado o cadena vacía si es nulo
                                  esAdmin: false,
                                ));
                                if (registrado) {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Center(child: Text('Usuario Registrado')),
                                      content: Text(
                                          'Nombre: $matricula\nContraseña: $contrasena\nTipo de Usuario: $tipoUsuario'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cerrar'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('El usuario ya existe')));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                minimumSize: const Size(150, 0),
                              ),
                              child: const Text('Registrar', style: TextStyle(fontSize: 17)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}