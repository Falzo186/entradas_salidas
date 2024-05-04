import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/HistorialOperador.dart';
import 'package:entradas_salidas/Modelo/InfraccionOperador.dart';

class ControladorHistorialOperador{
    
    final CollectionReference RegistroInFraccionesOperado =FirebaseFirestore.instance.collection('RegistroInFraccionesOperador');
  final CollectionReference HistorialOperado = FirebaseFirestore.instance.collection('HistorialOperador');   
 
Future<List<InfraccionOperador>> getRegistroInFraccionesOperador(String idChofer) async {
  List<InfraccionOperador> registroInfracciones = [];
  final querySnapshot = await RegistroInFraccionesOperado
      .where('idchofer', isEqualTo: idChofer)
      .get();
  for (var doc in querySnapshot.docs) {
    registroInfracciones.add(InfraccionOperador(
      idChofer: doc['idchofer'],
      Infraccion: doc['Infraccion'],
    ));
  }
  return registroInfracciones;
}

Future<List<HistorialOperador>> getHistorialOperador(String idChofer) async {
  List<HistorialOperador> historialOperador = [];
  final querySnapshot = await HistorialOperado
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