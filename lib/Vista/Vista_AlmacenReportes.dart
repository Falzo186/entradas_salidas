
import 'package:entradas_salidas/Controlador/Controlador_Almacen.dart';
import 'package:entradas_salidas/Modelo/ReporteAlmacen.dart';
import 'package:flutter/material.dart';

class VistaReportes extends StatefulWidget {
  @override
  State<VistaReportes> createState() => _VistaReportesState();
}

class _VistaReportesState extends State<VistaReportes> {
  List<ReporteAlmacen> reportes = [];
  ControladorAlmacen controlador = ControladorAlmacen();
   void initState() {
  super.initState();
  cargarReportes();
}

Future<void> cargarReportes() async {
  List<ReporteAlmacen> listaCamiones = await controlador.obtenerReportes();
  setState(() {
    reportes = listaCamiones;
  });
}


 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Almacén'),
    ),
    body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Tipo')),
            DataColumn(label: Text('Nom. Producto')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('Fecha')),
            DataColumn(label: Text('Usuario')),
            DataColumn(label: Text('Encargado')),
          ],
          rows: reportes.map((objeto) {
            return DataRow(cells: [
              DataCell(Text(objeto.tipo)),
              DataCell(Text(objeto.nomproducto)),
              DataCell(Text(objeto.Cantidad.toString())),
              DataCell(Text(objeto.Fecha.toString())),
              DataCell(Text(objeto.Usuario)),
              DataCell(Text(objeto.Encargado)),
            ]);
          }).toList(),
        ),
      ),
    ),
  );
}

}