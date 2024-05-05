class ReporteAlmacen{
  String tipo; //Entrada o Salida
  String nomproducto;
  String Cantidad;
  String Fecha;
  String Usuario;
  String Encargado;
  

  ReporteAlmacen({
    required this.tipo,
    required this.nomproducto,
    required this.Cantidad,
    required this.Fecha,
    required this.Usuario,
    required this.Encargado,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nomproducto': nomproducto,
      'Cantidad': Cantidad,
      'Fecha': Fecha,
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
      Usuario: data['Usuario'] ?? '',
      Encargado: data['Encargado'] ?? '',
    );
  }
  
}