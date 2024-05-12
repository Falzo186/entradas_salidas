
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/Camion.dart';
import 'package:entradas_salidas/Modelo/HistorialOperador.dart';
// ignore: camel_case_types
class ControladorCamiones {
 
  final CollectionReference _camionesCollection =FirebaseFirestore.instance.collection('Camiones');
  final CollectionReference Historial = FirebaseFirestore.instance.collection('HistorialOperador'); 

  Future<bool> registrarCamion(Camion camion) async {
    final querySnapshot = await _camionesCollection
        .where('matricula', isEqualTo: camion.matricula)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return false;
    }
    await _camionesCollection.add(camion.toMap());
    return true;
  }
 

  Future<List<Camion>> getCamionesDeBD() async {
    List<Camion> camiones = [];
    final querySnapshot = await _camionesCollection.get();
    for (var doc in querySnapshot.docs) {
      camiones.add(Camion(
        matricula: doc['matricula'],
        modelo: doc['modelo'],
        anoFabricacion: doc['anoFabricacion'],
        companiaTransporte: doc['companiaTransporte'],
        enTransito: doc['enTransito'],
        kilometraje: doc['kilometraje'],
        ultimoServicio: doc['ultimoServicio'],
        proximoServicio: doc['proximoServicio'],
      ));
    }
    return camiones;
  }

  Future<bool> eliminarCamion(String matricula) async {
    final querySnapshot = await _camionesCollection
        .where('matricula', isEqualTo: matricula)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    }

    await _camionesCollection.doc(querySnapshot.docs[0].id).delete();
    return true;
  }

  Future<bool> actualizarCamion(Camion camion) async {
    final querySnapshot = await _camionesCollection
        .where('matricula', isEqualTo: camion.matricula)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    }

    await _camionesCollection.doc(querySnapshot.docs[0].id).update(camion.toMap());
    return true;
  }
  
  Future<String> getEstado(Camion camion) async {
    final querySnapshot = await _camionesCollection
        .where('matricula', isEqualTo: camion.matricula)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return 'Disponible';
    }
    bool enTransito = querySnapshot.docs[0].get('enTransito');
    return enTransito ? 'enTransito' : 'Disponible';
  }

Future<List<HistorialOperador>> getHistorialOperador(String matriculaCamion) async {
  List<HistorialOperador> historialOperador = [];
  final querySnapshot = await Historial
      .where('matriculaCamion', isEqualTo: matriculaCamion)
      .orderBy('fecha', descending: true)
      .orderBy('hora', descending: true)
      .get();
  for (var doc in querySnapshot.docs) {
    historialOperador.add(HistorialOperador(
      idChofer: doc['idChofer'],
      folio: doc['folio'],
      matriculaCamion: doc['matriculaCamion'],
      fecha: doc['fecha'],
      hora: doc['hora'],
      tipo: doc['tipo'],
    ));
  }
  return historialOperador;
}



}
