class ReporteAlmacen{
  String tipo; //Entrada o Salida
  String nomproducto;
  String Cantidad;
  String Fecha;
  String hora;
  String Usuario;
  String Encargado;
  

  ReporteAlmacen({
    required this.tipo,
    required this.nomproducto,
    required this.Cantidad,
    required this.Fecha,
    required this.hora,
    required this.Usuario,
    required this.Encargado,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nomproducto': nomproducto,
      'Cantidad': Cantidad,
      'Fecha': Fecha,
      'hora': hora,
      'Usuario': Usuario,
      'Encargado': Encargado,
    };
  }

  factory ReporteAlmacen.fromFirestore(Map<String, dynamic> data) {
    return ReporteAlmacen(
      tipo: data['tipo'] ?? '',
      nomproducto: data['nomproducto'] ?? '',
      Cantidad: data['Cantidad'] ?? '',
      Fecha: data['Fecha'] ?? '',
      hora: data['hora'] ?? '',
      Usuario: data['Usuario'] ?? '',
      Encargado: data['Encargado'] ?? '',
    );
  }
  
}