
class Camion {
  String matricula;
  String modelo;
  int anoFabricacion;
  String companiaTransporte;
  bool enTransito;
  bool enEspera;
  bool enMantenimiento;
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
    this.enEspera = false,
    this.enMantenimiento = false,
    required this.kilometraje,
    required this.ultimoServicio,
    required this.proximoServicio,
    required this.historialCargas,
  });
}
