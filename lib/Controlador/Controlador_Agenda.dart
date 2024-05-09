import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/Agenda.dart';
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';

class ControladorAgenda {

 final CollectionReference Agendas =FirebaseFirestore.instance.collection('Agendas');

  Future<bool> agregarAgenda(Agenda agenda) async {
    try {
      await Agendas.add(agenda.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Agenda2>> obtenerAgendasEntrada() async {
    try {
      QuerySnapshot querySnapshot = await Agendas
          .where('tipo', isEqualTo: 'Entrada')
          .orderBy('fecha', descending: false)
          .get();
      return querySnapshot.docs.map((doc) => Agenda2.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener las agendas de entrada: $e');
      return [];
    }
  }

  Future<List<Agenda2>> obtenerAgendasSalida() async {
    try {
      QuerySnapshot querySnapshot = await Agendas
          .where('tipo', isEqualTo: 'Salida')
          .orderBy('fecha', descending: false)
          .get();

      return querySnapshot.docs.map((doc) => Agenda2.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener las agendas de salida: $e');
      return [];
    }
  }




}