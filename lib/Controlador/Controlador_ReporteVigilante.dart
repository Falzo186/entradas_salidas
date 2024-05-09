import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/ObservacionVigilante.dart';
import 'package:entradas_salidas/Modelo/ReporteVigilante.dart';

class controlador_ReporteVigilante {

final CollectionReference ReporteVigilant =FirebaseFirestore.instance.collection('ReporteVigilante');
final CollectionReference Agendas =FirebaseFirestore.instance.collection('Agendas');
final CollectionReference ObservacionesVigilante =FirebaseFirestore.instance.collection('ObservacionesVigilante');


Future<bool> agregarObservacionVigilante(ObservacionVigilante observacionVigilante) async {
  try {
    await ObservacionesVigilante.add(observacionVigilante.toMap());
    return true;
  } catch (e) {
    print('Error al agregar la observación del vigilante: $e');
    return false;
  }
}

Future<void> eliminarAgenda(String folio) async {
  try {
    QuerySnapshot querySnapshot = await Agendas.where('folio', isEqualTo: folio).get();
    if (querySnapshot.docs.isNotEmpty) {
      await Agendas.doc(querySnapshot.docs[0].id).delete();
    }
  } catch (e) {
    print('Error al eliminar la agenda: $e');
  }
}

  Future<bool> agregarReporteVigilante(ReporteVigilante reporteVigilante) async {
    try {
      await ReporteVigilant.add(reporteVigilante.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ReporteVigilante>> obtenerReporteVigilanteEntrada() async {
    try {
      QuerySnapshot querySnapshot = await ReporteVigilant
          .where('tipo', isEqualTo: 'Entrada')
          .orderBy('fecha', descending: false)
          .get();
      return querySnapshot.docs.map((doc) => ReporteVigilante.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener los reportes de entrada: $e');
      return [];
    }
  }

  Future<List<ReporteVigilante>> obtenerReporteVigilanteSalida() async {
    try {
      QuerySnapshot querySnapshot = await ReporteVigilant
          .where('tipo', isEqualTo: 'Salida')
          .orderBy('fecha', descending: false)
          .get();

      return querySnapshot.docs.map((doc) => ReporteVigilante.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener los reportes de salida: $e');
      return [];
    }
  }


}
