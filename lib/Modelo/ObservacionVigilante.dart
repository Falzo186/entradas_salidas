import 'package:cloud_firestore/cloud_firestore.dart';

class ObservacionVigilante{
  String folio;
  String observacion;

  ObservacionVigilante({
    required this.folio,
    required this.observacion,
  });

  Map<String, dynamic> toMap() {
    return {
      'folio': folio,
      'observacion': observacion,
    };
  }

  factory ObservacionVigilante.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ObservacionVigilante(
      folio: data['folio'],
      observacion: data['observacion'],
    );
  }
}