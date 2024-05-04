class Operador {
  String IdChofer;
  String nombre;
  String licenciaConducir;
  String contacto;
  String estadoSalud;

  Operador({
    required this.IdChofer,
    required this.nombre,
    required this.licenciaConducir,
    required this.contacto,
    required this.estadoSalud,
  });
  Map<String, dynamic> toMap() {
    return {
      'IdChofer': IdChofer,
      'nombre': nombre,
      'licenciaConducir': licenciaConducir,
      'contacto': contacto,
      'estadoSalud': estadoSalud,
    };
  }
}


