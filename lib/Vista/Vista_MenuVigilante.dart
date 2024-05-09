import 'package:entradas_salidas/Controlador/Controlador_camiones.dart';
import 'package:entradas_salidas/Modelo/Camion.dart';
import 'package:entradas_salidas/Vista/HistoryScreen.dart';
import 'package:entradas_salidas/Vista/Vista_Agenda.dart';
import 'package:entradas_salidas/Vista/Vista_Camion.dart';
import 'package:entradas_salidas/Vista/Vista_ObservacionesVigilante.dart';
import 'package:entradas_salidas/Vista/Vista_Operador.dart';
import 'package:flutter/material.dart';
class MenuVigilante extends StatefulWidget {
  MenuVigilante({Key? key}) : super(key: key);

  @override
  State<MenuVigilante> createState() => _MenuVigilanteState();
}

class _MenuVigilanteState extends State<MenuVigilante> {
  ControladorCamiones controladorCamiones = ControladorCamiones();
  List<Camion> camiones = [];

  @override
 void initState() {
  super.initState();
  _cargarCamiones();
}

Future<void> _cargarCamiones() async {
  List<Camion> listaCamiones = await controladorCamiones.getCamionesDeBD();
  setState(() {
    camiones = listaCamiones;
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
        color: Color.fromARGB(255, 243, 238, 238),
      ),
    ),
    child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 238),
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
                      bottom: 130,
                      left: 160,
                    ),
                    child: Text(
                      'Menú\n                Vigilante',
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
                  top: 40,
                  left: 40.0,
                  right: 40.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        height: 180,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 33, 137, 141),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(''),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.07),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 170,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text('camion 1'),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 170,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text('camion 2'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: const Text(
                                '      Texto Adicional',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 170,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text('Operador 1'),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 170,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text('Operador 2'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 39, 39),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.local_shipping, size: 40),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VistaCamion()),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.people, size: 40),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VistaOperador()),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, size: 40),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VistaAgenda()),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.checklist_outlined, size: 40),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryScreen()),
                      );
                    },
                  ),
                   const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.note, size: 40),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => vistaObservaciones()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 100,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
                color: Colors.black,
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
                'lib/assets/camion.png',
                width: 250,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}