import 'package:entradas_salidas/Modelo/Almacenobjeto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

enum TipoBusqueda {
  Nombre,
  Folio,
}

class VistaConsultas extends StatefulWidget {
  @override
  _VistaConsultasState createState() => _VistaConsultasState();
}

class _VistaConsultasState extends State<VistaConsultas> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  TipoBusqueda _tipoBusqueda = TipoBusqueda.Nombre;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.90,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 15, 58, 47),
            Color.fromARGB(255, 52, 174, 190),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 300,
                right: 0,
              ),
              child: Column(
                children: [
                  const Text(
                    'Catálogo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            const Text('Buscar por: '),
                            DropdownButton<TipoBusqueda>(
                              value: TipoBusqueda.Nombre,
                              onChanged: (value) {},
                              items: const [
                                DropdownMenuItem(
                                  value: TipoBusqueda.Nombre,
                                  child: Text('Nombre'),
                                ),
                                DropdownMenuItem(
                                  value: TipoBusqueda.Folio,
                                  child: Text('Folio'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 129, 26, 26).withOpacity(0.10),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.grey),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TypeAheadField<Almacenobjeto>(
                                  suggestionsCallback: (pattern) async {
                                    QuerySnapshot querySnapshot;
                                    querySnapshot = await FirebaseFirestore.instance
                                        .collection('Almacen')
                                        .where('nombre', isGreaterThanOrEqualTo: pattern)
                                        .where('nombre', isLessThan: '${pattern}z')
                                        .get();
                                    List<Almacenobjeto> suggestions = querySnapshot.docs
                                        .map((doc) => Almacenobjeto.fromFirestore(doc))
                                        .toList();
                                    return suggestions;
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: Text(suggestion.nombre),
                                      subtitle: Text('Folio: ${suggestion.folio}'),
                                    );
                                  },
                                  onSelected: (suggestion) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Detalles del producto'),
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Folio: ${suggestion.folio}'),
                                              Text('Nombre: ${suggestion.nombre}'),
                                              Text('Stock: ${suggestion.cantidad}'),
                                              Text('Marca: ${suggestion.marca}'),
                                              Text('Medición: ${suggestion.medicion}'),
                                              Text('Proveedor: ${suggestion.proveedor}'),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cerrar'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  emptyBuilder: (context) => const Center(
                                    child: Text('No se encontraron resultados'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}


