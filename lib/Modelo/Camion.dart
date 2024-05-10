
class Camion {
  String matricula;
  String modelo;
  String anoFabricacion;
  String companiaTransporte;
  bool enTransito;
  String kilometraje;
  String ultimoServicio;
  String proximoServicio;

  Camion({
    required this.matricula,
    required this.modelo,
    required this.anoFabricacion,
    required this.companiaTransporte,
    this.enTransito = false,
    required this.kilometraje,
    required this.ultimoServicio,
    required this.proximoServicio,
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
    };
  }
}
