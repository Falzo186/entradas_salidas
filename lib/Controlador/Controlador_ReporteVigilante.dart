import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entradas_salidas/Modelo/Camion.dart';
import 'package:entradas_salidas/Modelo/ObservacionVigilante.dart';
import 'package:entradas_salidas/Modelo/ReporteVigilante.dart';
import 'package:intl/intl.dart';

class controlador_ReporteVigilante {

final CollectionReference ReporteVigilant =FirebaseFirestore.instance.collection('ReporteVigilante');
final CollectionReference Agendas =FirebaseFirestore.instance.collection('Agendas');
final CollectionReference ObservacionesVigilante =FirebaseFirestore.instance.collection('ObservacionesVigilante');
final CollectionReference _camionesCollection =FirebaseFirestore.instance.collection('Camiones');
final CollectionReference Historial = FirebaseFirestore.instance.collection('HistorialOperador');  


Future<void> eliminarAgenda(String folio,String nombreOperador,bool enTransito,String tipo) async {
  try {
    // Obtener la agenda a eliminar
    QuerySnapshot querySnapshot = await Agendas.where('folio', isEqualTo: folio).get();
    if (querySnapshot.docs.isNotEmpty) {
      // Obtener el documento de la agenda
      DocumentSnapshot agendaDoc = querySnapshot.docs[0];
      // Obtener los datos de la agenda
      Map<String, dynamic>? agendaData = agendaDoc.data() as Map<String, dynamic>?;

      if (agendaData != null) {
        // Obtener la matrícula del camión
        String matriculaCamion = agendaData['matriculaCamion'];
        print('Matrícula del camión: $matriculaCamion');

        // Buscar el camión en la colección 'Camiones'
        Camion camion = await buscarCamion(matriculaCamion);

        if (camion != null) {
          // Actualizar el último servicio y el próximo servicio del camión
            await _camionesCollection
              .where('matricula', isEqualTo: matriculaCamion)
              .get()
              .then((querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              String docId = querySnapshot.docs[0].id;
              _camionesCollection.doc(docId).update({
              'ultimoServicio': camion.proximoServicio,
              'proximoServicio': 'En espera',
              'enTransito': enTransito,
              });
            } else {
              print('No se encontró el camión con la matrícula especificada');
            }
            });
          // Agregar el historial de operador
          await Historial.add({
                          'idChofer': nombreOperador,
                           'folio': folio,
                             'matriculaCamion': matriculaCamion,
                               'fecha': DateFormat('dd/MM/yy').format(DateTime.now()),
                                     'hora': DateFormat('HH:mm').format(DateTime.now()),
                                           'tipo': tipo,
                                              });
                                              
          // Eliminar la agenda
          await Agendas.doc(agendaDoc.id).delete();
        } else {
          print('No se encontró el camión con la matrícula especificada');
        }
      } else {
        print('No se encontró la agenda con el folio especificado');
      }
    }
  } catch (e) {
    print('Error al eliminar la agenda: $e');
  }
}

 Future<Camion> buscarCamion(String matricula) async {
    final querySnapshot = await _camionesCollection
        .where('matricula', isEqualTo: matricula)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return  Camion(
        matricula: '',
        modelo: '',
        anoFabricacion: '',
        companiaTransporte: '',
        enTransito: false,
        kilometraje: '',
        ultimoServicio: '',
        proximoServicio: '',
      );
    }
    var doc = querySnapshot.docs[0];
    return Camion(
      matricula: doc['matricula'],
      modelo: doc['modelo'],
      anoFabricacion: doc['anoFabricacion'],
      companiaTransporte: doc['companiaTransporte'],
      enTransito: doc['enTransito'],
      kilometraje: doc['kilometraje'],
      ultimoServicio: doc['ultimoServicio'],
      proximoServicio: doc['proximoServicio'],
    );
  }






Future<bool> agregarObservacionVigilante(ObservacionVigilante observacionVigilante) async {
  try {
    await ObservacionesVigilante.add(observacionVigilante.toMap());
    return true;
  } catch (e) {
    print('Error al agregar la observación del vigilante: $e');
    return false;
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

  // Future<List<ReporteVigilante>> obtenerReporteVigilanteEntrada() async {
  //   try {
  //     QuerySnapshot querySnapshot = await ReporteVigilant
          
  //         .orderBy('fecha', descending: false)
  //         .get();
  //     return querySnapshot.docs.map((doc) => ReporteVigilante.fromFirestore(doc)).toList();
  //   } catch (e) {
  //     print('Error al obtener los reportes de entrada: $e');
  //     return [];
  //   }
  // }

  Future<List<ReporteVigilante>> obtenerReporteVigilanteSalida() async {
    try {
      QuerySnapshot querySnapshot = await ReporteVigilant
          .orderBy('fecha', descending: true)
          .orderBy('hora', descending: true)
          .get();

      return querySnapshot.docs.map((doc) => ReporteVigilante.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error al obtener los reportes de salida: $e');
      return [];
    }
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
  




}
