import 'package:entradas_salidas/Controlador/Controlador_camiones.dart';
import 'package:entradas_salidas/Modelo/HistorialOperador.dart';
import 'package:flutter/material.dart';
import '../Modelo/Camion.dart';


  @override
  class VistaDetallesCamion extends StatefulWidget {
    final Camion camion;

    const VistaDetallesCamion({required this.camion, Key? key}) : super(key: key);

    @override
    // ignore: library_private_types_in_public_api
    _VistaDetallesCamionState createState() => _VistaDetallesCamionState();
  }

  class _VistaDetallesCamionState extends State<VistaDetallesCamion> {
    // ignore: non_constant_identifier_names
    late List<HistorialOperador> HistorialCamion;
    ControladorCamiones controlador = ControladorCamiones();

    @override
    void initState() {
      super.initState();
      cargarHistorialCamion();
    }

    Future<void> cargarHistorialCamion() async {
      List<HistorialOperador> listaHistorialOperador =
          await controlador.getHistorialOperador(widget.camion.matricula);
      HistorialCamion = listaHistorialOperador;
      
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.camion.matricula,
            style: const TextStyle(color: Colors.white, fontSize: 30),
            overflow: TextOverflow.ellipsis,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.create_outlined, color: Colors.white, size: 30),
              onPressed: () {
                //  Navigator.of(context, rootNavigator: true).push(
                //                       MaterialPageRoute(
                //                         builder: (context) => VistaAgregarInfraccionOperador( operador: widget.operador,usuario: widget.usuario,)));
              },
            ),
          ],
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
        body: ListView(
          children: [
            ListTile(
              title: Text('Matricula: ${widget.camion.matricula}'),
            ),
            ListTile(
              title: Text('Año de fabricacion: ${widget.camion.anoFabricacion}'),
            ),
            ListTile(
              title: Text('Compañia de transporte: ${widget.camion.companiaTransporte}'),
            ),
            ListTile(
              title: Text('Estado: ${widget.camion.enTransito}'),
            ),
            ListTile(
              title: Text('Kilometraje: ${widget.camion.kilometraje}'),
            ),
            ListTile(
              title: Text('Ultimo Servicio: ${widget.camion.ultimoServicio}'),
            ),
            ListTile(
              title: Text('Proximo Servicio: ${widget.camion.proximoServicio}'),
            ),
            FutureBuilder(
              future: cargarHistorialCamion(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return Column(
        children: [
          const ListTile(
            title: Text('-Historial de viajes:'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: HistorialCamion.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Folio: ${HistorialCamion[index].folio} - Fecha: ${HistorialCamion[index].fecha} ${HistorialCamion[index].hora}'),
                onTap: () {
                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                      title: const Text('Detalles del Historial'),
                      content: SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Folio: ${HistorialCamion[index].folio}'),
                          Text('Fecha: ${HistorialCamion[index].fecha} ${HistorialCamion[index].hora}'),
                          Text('Operador: ${HistorialCamion[index].idChofer}'),
                          Text('Tipo: ${HistorialCamion[index].tipo}')
                        ],
                        ),
                      ),
                      actions: [
                        TextButton(
                        child: const Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        ),
                      ],
                      );
                    },
                    );
                },
              );
            },
          ),
          
        ],
      );
    }
  },
),
      ],
    ),
  );
}
}