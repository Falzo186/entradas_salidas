import 'package:entradas_salidas/Controlador/Controlador_Almacen.dart';
import 'package:flutter/material.dart';
import '../Modelo/Almacenobjeto.dart'; 
import 'Vista_EntradaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_SalidaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_ActualizarProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto

class Almacen extends StatefulWidget {
  const Almacen({super.key});

 @override
 _AlmacenState createState() => _AlmacenState();
}

class _AlmacenState extends State<Almacen> {
   List<Almacenobjeto> objetosAlmacen = [];
  ControladorAlmacen controlador = ControladorAlmacen();

  void initState() {
  super.initState();
  cargarProductos();
}

Future<void> cargarProductos() async {
  List<Almacenobjeto> listaCamiones = await controlador.getProductosBD();
  setState(() {
    objetosAlmacen = listaCamiones;
  });
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Almacén'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Folio')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Cantidad')),
            DataColumn(label: Text('Marca')),
            DataColumn(label: Text('Medición')),
            DataColumn(label: Text('Proveedor')),
          ],
          rows: objetosAlmacen.map((objeto) {
            return DataRow(cells: [
              DataCell(Text(objeto.folio)),
              DataCell(Text(objeto.nombre)),
              DataCell(Text(objeto.cantidad.toString())),
              DataCell(Text(objeto.marca)),
              DataCell(Text(objeto.medicion)),
              DataCell(Text(objeto.proveedor)),
            ]);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 39, 39),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.file_upload_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Altas()),
                  );
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.file_download_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bajas()),
                  );
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.edit_note_outlined, size: 40),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Actualizar()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}