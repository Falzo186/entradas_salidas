
import 'package:entradas_salidas/Controlador/Controlador_Almacen.dart';
import 'package:entradas_salidas/Modelo/ReporteAlmacen.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class VistaReportes extends StatefulWidget {
  const VistaReportes({super.key});

  @override
  State<VistaReportes> createState() => _VistaReportesState();
}

class _VistaReportesState extends State<VistaReportes> {
  List<ReporteAlmacen> reportes = [];
  ControladorAlmacen controlador = ControladorAlmacen();

  @override
  void initState() {
    super.initState();
    cargarReportes();
  }

  Future<void> cargarReportes() async {
    List<ReporteAlmacen> listaReportes = await controlador.obtenerReportes();
    setState(() {
      reportes = listaReportes;
    });
  }

 Future<void> generarPDF() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Table.fromTextArray(
          border: pw.TableBorder.all(),
          headerAlignment: pw.Alignment.center,
          cellAlignment: pw.Alignment.center,
          headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
          data: [
            ['Tipo', 'Producto', 'Cantidad', 'Fecha', 'Usuario', 'Encargado'],
            for (var reporte in reportes)
              [
                reporte.tipo,
                reporte.nomproducto,
                reporte.Cantidad,
                reporte.Fecha,
                reporte.Usuario,
                reporte.Encargado
              ],
          ],
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/reportes.pdf");
  try {
    await file.writeAsBytes(await pdf.save());
    OpenFile.open(file.path);
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('PDF generado'),
          content: const Text('El PDF se ha generado correctamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('No se pudo generar el PDF.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reportes', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
            onPressed: () async {
              await generarPDF();
            
            },
          ),
        ],
        centerTitle: true,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 15, 58, 47),
                Color.fromARGB(255, 52, 174, 190),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: reportes.map((objeto) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Theme(
                    data: ThemeData.light(),
                    child: Container(
                      child: AlertDialog(
                        title: const Text('Especificaciones', style: TextStyle(color: Colors.black)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tipo: ${objeto.tipo}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                            Text('Nom. Producto: ${objeto.nomproducto}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                            Text('Cantidad: ${objeto.Cantidad}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                            Text('Fecha: ${objeto.Fecha}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                            Text('Hora: ${objeto.hora}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                            Text('Usuario: ${objeto.Usuario}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                            Text('Encargado: ${objeto.Encargado}', style: const TextStyle(color: Colors.black, fontSize: 20)),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cerrar', style: TextStyle(color: Colors.black, fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 150.0,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tipo: ${objeto.tipo}'),
                  Text('Fecha: ${objeto.Fecha} a las ${objeto.hora}'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
// Future<void> generarPDF() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Table.fromTextArray(
//             border: pw.TableBorder.all(),
//             headerAlignment: pw.Alignment.center,
//             cellAlignment: pw.Alignment.center,
//             headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
//             data: [
//               ['Tipo', 'Producto', 'Cantidad', 'Fecha', 'Usuario', 'Encargado'],
//               for (var reporte in reportes)
//                 [reporte.tipo, reporte.nomproducto, reporte.Cantidad, reporte.Fecha, reporte.Usuario, reporte.Encargado],
//             ],
//           );
//         },
//       ),
//     );

//     final output = await getTemporaryDirectory();
//     final file = File("${output.path}/reportes.pdf");
//     await file.writeAsBytes(await pdf.save());
//   }

