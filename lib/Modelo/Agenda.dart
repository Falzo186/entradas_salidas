
import 'package:cloud_firestore/cloud_firestore.dart';

class Agenda {
  String folio;
  String matriculaCamion;
  String nombreOperador;
  String fecha;
  String hora;
  String tipo; //entrada o salida
  String tipodeCarga;
  String pesoCarga;
  String destinoCarga;
  

    Agenda({
    required this.folio,
    required this.matriculaCamion,
    required this.nombreOperador,
    required this.fecha,
    required this.hora,
    required this.tipo,
    required this.tipodeCarga,
    required this.pesoCarga,
    required this.destinoCarga,
  });

  Map<String, dynamic> toMap() {
  return {
    'folio': folio,
    'matriculaCamion': matriculaCamion,
    'nombreOperador': nombreOperador,
    'fecha': fecha,
    'hora': hora,
    'tipo': tipo,
    'tipodeCarga': tipodeCarga,
    'pesoCarga': pesoCarga,
    'destinoCarga': destinoCarga,
  };
}
  factory Agenda.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Agenda(
      folio: data['folio'],
      matriculaCamion: data['matriculaCamion'],
      nombreOperador: data['nombreOperador'],
      fecha: data['fecha'],
      hora: data['hora'],
      tipo: data['tipo'],
      tipodeCarga: data['tipodeCarga'],
      pesoCarga: data['pesoCarga'],
      destinoCarga: data['destinoCarga'],
    );
  }


}


