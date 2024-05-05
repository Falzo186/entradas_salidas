import 'package:cloud_firestore/cloud_firestore.dart';

class Almacenobjeto {
 final String folio;
 final String nombre;
 final int cantidad;
 final String marca;
 final String medicion;
 final String proveedor;

 Almacenobjeto({
    required this.folio,
    required this.nombre,
    required this.cantidad,
    required this.marca,
    required this.medicion,
    required this.proveedor,
 });
  Map<String, dynamic> toMap() {
    return {
      'folio': folio,
      'nombre': nombre,
      'cantidad': cantidad,
      'marca': marca,
      'medicion': medicion,
      'proveedor': proveedor,
    };
  }

  factory Almacenobjeto.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Almacenobjeto(
      folio: data['folio'] ?? '',
      nombre: data['nombre'] ?? '',
      cantidad: data['cantidad'] ?? 0,
      marca: data['marca'] ?? '',
      medicion: data['medicion'] ?? '',
      proveedor: data['proveedor'] ?? '',
    );
  }
}