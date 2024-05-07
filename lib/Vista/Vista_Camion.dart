import 'package:entradas_salidas/Controlador/Controlador_camiones.dart';
import 'package:entradas_salidas/Vista/Vista_altasCamiones.dart';

import '../Modelo/Camion.dart';
import 'Vista_DetallesCamion.dart';
import 'package:flutter/material.dart';


class VistaCamion extends StatefulWidget {
   VistaCamion({super.key});

  @override
  State<VistaCamion> createState() => _VistaCamionState();
}

class _VistaCamionState extends State<VistaCamion> {
  late List<Camion> _camiones;
  final ControladorCamiones controlador = ControladorCamiones();

  late Future<void> _futureCargaCamiones;

  @override
  void initState() {
    super.initState();
    _futureCargaCamiones = _cargarCamiones();
  }

  Future<void> _cargarCamiones() async {
    List<Camion> listaCamiones = await controlador.getCamionesDeBD();
    setState(() {
      _camiones = listaCamiones;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Camiones', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_outlined, size: 30),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AltaCamionView()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _futureCargaCamiones,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.separated(
              itemCount: _camiones.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Matrícula: ${_camiones[index].matricula}'),
                  subtitle: FutureBuilder<String>(
                    future: controlador.getEstado(_camiones[index]),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Estado: Loading...', style: TextStyle(color: Color.fromARGB(255, 7, 68, 9)));
                      } else if (snapshot.hasError) {
                        return const Text('Estado: Error', style: TextStyle(color: Color.fromARGB(255, 7, 68, 9)));
                      } else {
                        return Text('Estado: ${snapshot.data}', style: const TextStyle(color: Color.fromARGB(255, 7, 68, 9)));
                      }
                    },
                  ),
                  tileColor: const Color.fromARGB(206, 243, 235, 235),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VistaDetallesCamion(camion: _camiones[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}


