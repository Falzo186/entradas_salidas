class HistorialCamion {

 int id;
String Datos;

  HistorialCamion({
    required this.id,
    required this.Datos,
  });

  factory HistorialCamion.fromJson(Map<String, dynamic> json) {
    return HistorialCamion(
      id: json['id'],
      Datos: json['Datos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Datos': Datos,
    };
  }
 
}