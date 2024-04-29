class Usuario {
  String nombre;
  String contrasena;
  String matricula;
  String tipoUsuario; // "almacenista" o "vigilante"
  bool esAdmin;

  Usuario({
    required this.nombre,
    required this.contrasena,
    required this.matricula,
    required this.tipoUsuario,
    required this.esAdmin,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'contrasena': contrasena,
      'matricula': matricula,
      'tipoUsuario': tipoUsuario,
      'esAdmin': esAdmin,
    };
  }
}
