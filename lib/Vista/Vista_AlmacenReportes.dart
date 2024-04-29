
import 'package:flutter/material.dart';

class Bitacora extends StatefulWidget {
 @override
 _BitacoraState createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitacora'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Folio')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('Fecha')),
            DataColumn(label: Text('Usuario')),
            DataColumn(label: Text('Encargado')),
          ],
          rows: List<DataRow>.generate(
            10, // Número de filas en la tabla
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(Text('Folio ')),
                DataCell(Text('Cantidad')),
                DataCell(Text('Fecha ')),
                DataCell(Text('Usuario $index')),
                DataCell(Text('Encargado $index')),
              ],
            ),
          ),
        ),
      ),
    );
 }
}