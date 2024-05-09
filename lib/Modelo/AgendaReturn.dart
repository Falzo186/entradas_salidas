
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Agenda2 {
  String folio;
  String matriculaCamion;
  String nombreOperador;
  String fecha;
  String hora;
  String tipo; //entrada o salida
  String tipodeCarga;
  String pesoCarga;
  String destinoCarga;
  

    Agenda2({
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
 factory Agenda2.fromFirestore(DocumentSnapshot doc) {
  Map data = doc.data() as Map<String, dynamic>;
  DateTime fecha = (data['fecha'] as Timestamp).toDate();
  String fechaFormateada = DateFormat('yyyy-MM-dd').format(fecha); // Formato de fecha
  String horaFormateada = DateFormat('HH:mm').format(fecha); // Formato de hora
  return Agenda2(
    folio: data['folio'],
    matriculaCamion: data['matriculaCamion'],
    nombreOperador: data['nombreOperador'],
    fecha: fechaFormateada,
    hora: horaFormateada,
    tipo: data['tipo'],
    tipodeCarga: data['tipodeCarga'],
    pesoCarga: data['pesoCarga'],
    destinoCarga: data['destinoCarga'],
  );
}




}
