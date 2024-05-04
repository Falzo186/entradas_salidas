import 'package:entradas_salidas/Controlador/Controlador_camiones.dart';
import 'package:entradas_salidas/Modelo/Camion.dart';
import 'package:entradas_salidas/Vista/HistoryScreen.dart';
import 'package:entradas_salidas/Vista/Vista_Agenda.dart';
import 'package:entradas_salidas/Vista/Vista_Camion.dart';
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
          backgroundColor: Color.fromARGB(255, 41, 39, 39),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 243, 238, 238),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 238, 238),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(color: Color.fromARGB(255, 41, 39, 39)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 30.0),
                      child: Text(
                        'Bienvenido',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 30.0)),
                        const Text(
                          'Buscar',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          height: 100,
                          child: IconButton(
                            icon: const Icon(Icons.search, size: 25),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 170,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            color: Colors.white,
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
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            color: Colors.white,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text('Operaador 2'),
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
                  icon: const Icon(Icons.local_shipping, size: 40),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  VistaCamion()),
                    );
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.people, size: 40),
                  color: Colors.white,
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  VistaOperador()),
                    );

                  },
                ),
                const SizedBox(width: 10),
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
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.checklist_outlined, size: 40),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()), // Pasa historyEntries de Data
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
