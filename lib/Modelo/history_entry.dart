
class HistoryEntry {
  final DateTime dateTime;
  final String driverName;
  final String truckId;
  final String type; //"Entrada" o "Salida"

  HistoryEntry({
    required this.dateTime,
    required this.driverName,
    required this.truckId,
    required this.type,
  });
}