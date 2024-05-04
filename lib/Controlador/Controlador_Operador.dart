import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/Operador.dart';

class ControladorOperador{

 final CollectionReference _operadoresCollection =
      FirebaseFirestore.instance.collection('Operadores');

  Future<bool> registrarOperador(Operador operador) async {
    final querySnapshot = await _operadoresCollection
        .where('IdChofer', isEqualTo: operador.IdChofer)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return false;
    }
    await _operadoresCollection.add(operador.toMap());
    return true;
  }

  Future<bool> eliminarOperador(String IdChofer) async {
    final querySnapshot = await _operadoresCollection
        .where('IdChofer', isEqualTo: IdChofer)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    }

    await _operadoresCollection.doc(querySnapshot.docs[0].id).delete();
    return true;
  }

  Future<List<Operador>> getOperadoresDeBD() async {
    List<Operador> operadores = [];
    final querySnapshot = await _operadoresCollection.get();
    for (var doc in querySnapshot.docs) {
      operadores.add(Operador(
        IdChofer: doc['IdChofer'],
        nombre: doc['nombre'],
        licenciaConducir: doc['licenciaConducir'],
        contacto: doc['contacto'],
        estadoSalud: doc['estadoSalud'],
      ));
    }
    return operadores;
  }

}