import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/HistorialOperador.dart';
import 'package:entradas_salidas/Modelo/InfraccionOperador.dart';

class ControladorHistorialOperador{
    
    final CollectionReference Infracciones =FirebaseFirestore.instance.collection('RegistroInFraccionesOperador');
  final CollectionReference Historial = FirebaseFirestore.instance.collection('HistorialOperador');   
 
Future<List<InfraccionOperador>> getRegistroInFraccionesOperador(String idChofer) async {
  List<InfraccionOperador> registroInfracciones = [];
  final querySnapshot = await Infracciones
      .where('idChofer', isEqualTo: idChofer)
      .get();
  for (var doc in querySnapshot.docs) {
    registroInfracciones.add(InfraccionOperador(
      idChofer: doc['idChofer'],
      Infraccion: doc['Infraccion'],
    ));
  }
  return registroInfracciones;
}
Future<void> agregarInfraccionAlcoholico() async {
  String idChofer = '1'; // ID del chofer al que se le agregará la infracción
  String infraccion = 'Conducir bajo los efectos del alcohol'; // Tipo de infracción

  // Agregar la infracción a la colección de infracciones
  await Infracciones.add({
    'idChofer': idChofer,
    'Infraccion': infraccion,
  });
}


Future<List<HistorialOperador>> getHistorialOperador(String idChofer) async {
  List<HistorialOperador> historialOperador = [];
  final querySnapshot = await Historial
      .where('idChofer', isEqualTo: idChofer)
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