class InfraccionOperador {
  String idChofer;
  String Infraccion;
  String fecha;
  String encargado;

  InfraccionOperador({
    required this.idChofer,
    required this.Infraccion,
    required this.fecha,
    required this.encargado,
  });

  Map<String, dynamic> toMap() {
    return {
      'idChofer': idChofer,
      'Infraccion': Infraccion,
      'fecha': fecha,
      'encargado': encargado,
    };
  }

  factory InfraccionOperador.fromMap(Map<String, dynamic> map) {
    return InfraccionOperador(
      idChofer: map['idChofer'],
      Infraccion: map['Infraccion'],
      fecha: map['fecha'],
      encargado: map['encargado'],
    );
  }


  
}