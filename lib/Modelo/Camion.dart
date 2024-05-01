
class Camion {
  String matricula;
  String modelo;
  int anoFabricacion;
  String companiaTransporte;
  bool enTransito;
  int kilometraje;
  String ultimoServicio;
  String proximoServicio;
  int historialCargas;

  Camion({
    required this.matricula,
    required this.modelo,
    required this.anoFabricacion,
    required this.companiaTransporte,
    this.enTransito = false,
    required this.kilometraje,
    required this.ultimoServicio,
    required this.proximoServicio,
    required this.historialCargas,
  });

  Map<String, dynamic> toMap() {
    return {
      'matricula': matricula,
      'modelo': modelo,
      'anoFabricacion': anoFabricacion,
      'companiaTransporte': companiaTransporte,
      'enTransito': enTransito,
      'kilometraje': kilometraje,
      'ultimoServicio': ultimoServicio,
      'proximoServicio': proximoServicio,
      'historialCargas': historialCargas,
    };
  }
}
