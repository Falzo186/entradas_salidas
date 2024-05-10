import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/ObservacionVigilante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class vistaObservaciones extends StatefulWidget {
  const vistaObservaciones({super.key});

  @override
  _vistaObservacionesState createState() => _vistaObservacionesState();
}
enum TipoBusqueda {
  folio,
}
class _vistaObservacionesState extends State<vistaObservaciones> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  TipoBusqueda _tipoBusqueda = TipoBusqueda.folio;
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
                      bottom: 700,
                      right: 0,
                    ),
                    child: Text(
                      'Observaciones',
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
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
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
                            value: TipoBusqueda.folio,
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
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 219, 216, 216),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TypeAheadField<ObservacionVigilante>(
                            suggestionsCallback: (pattern) async {
                              QuerySnapshot querySnapshot;
                                querySnapshot = await _db
                                    .collection('ObservacionesVigilante')
                                    .where('folio', isGreaterThanOrEqualTo: pattern)
                                    .where('folio', isLessThan: '${pattern}z')
                                    .get();
                              
                              List<ObservacionVigilante> suggestions = querySnapshot.docs
                                  .map((doc) => ObservacionVigilante.fromFirestore(doc))
                                  .toList();
                              return suggestions;
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text('Folio: ${suggestion.folio}'),
                                subtitle: const Text('Observacion:...'),
                              );
                            },
                            onSelected: (suggestion) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Detalles de la observación'),
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Folio: ${suggestion.folio}'),
                                        Text('observacion: ${suggestion.observacion}'),
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
          ),
        ),
      ],
    ),
  );
}
}