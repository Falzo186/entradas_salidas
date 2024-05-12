import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';

class controladorVisual{
final CollectionReference Agendas =FirebaseFirestore.instance.collection('Agendas');
  
  Future<Agenda2?> obtenerProximaAgenda() async {
  try {
    QuerySnapshot querySnapshot = await Agendas
        .orderBy('fecha', descending: false)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return Agenda2.fromFirestore(querySnapshot.docs.first);
    } else {
      return Agenda2(
        folio: 'No hay agenda programada',
        fecha: "00-00-0000",
        hora: "00:00",
        tipo: '------',
        matriculaCamion: 'AAAA-0000',
        nombreOperador: '----------',
        tipodeCarga: "---------",
        pesoCarga: "-----------",
        destinoCarga: "--------",
      );
    }
  } catch (e) {
    print('Error al obtener la próxima agenda: $e');
    return null;
  }
}

}