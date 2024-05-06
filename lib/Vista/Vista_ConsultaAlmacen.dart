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
      appBar: AppBar(
        title: const Text('Consultas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text('Buscar por: '),
                DropdownButton<TipoBusqueda>(
                  value: _tipoBusqueda,
                  onChanged: (value) {
                    setState(() {
                      _tipoBusqueda = value!;
                    });
                  },
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
            TypeAheadField<Almacenobjeto>(
              suggestionsCallback: (pattern) async {
                QuerySnapshot querySnapshot;
                if (_tipoBusqueda == TipoBusqueda.Nombre) {
                  querySnapshot = await _db
                      .collection('Almacen')
                      .where('nombre', isGreaterThanOrEqualTo: pattern)
                      .where('nombre', isLessThan: pattern + 'z')
                      .get();
                } else {
                  querySnapshot = await _db
                      .collection('Almacen')
                      .where('folio', isGreaterThanOrEqualTo: pattern)
                      .where('folio', isLessThan: pattern + 'z')
                      .get();
                }
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
              )
            ),
          ],
        ),
      ),
    );
  }
}


