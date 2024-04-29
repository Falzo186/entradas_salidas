

import 'package:entradas_salidas/Modelo/history_entry.dart';

class Data {
  static List<HistoryEntry> historyEntries = [
    HistoryEntry(
      dateTime: DateTime.now(),
      driverName: 'Celine Diaz',
      truckId: '0001A',
      type: 'Entrada',
    ),
    HistoryEntry(
      dateTime: DateTime.now(),
      driverName: 'Julian Cruz',
      truckId: '002B',
      type: 'Salida',
    ),
    HistoryEntry(
      dateTime: DateTime.now(),
      driverName: 'Jesus Murillo',
      truckId: '003C',
      type: 'Entrada',
    ),
     HistoryEntry(
      dateTime: DateTime.now(),
      driverName: 'Aldo Serrano',
      truckId: '003B',
      type: 'Salida',
    ),
  ];
}