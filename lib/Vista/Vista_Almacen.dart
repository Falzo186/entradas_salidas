import 'package:entradas_salidas/Controlador/Controlador_Almacen.dart';
import 'package:flutter/material.dart';
import '../Modelo/Almacenobjeto.dart'; 
import 'Vista_EntradaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_SalidaProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'Vista_ActualizarProductoAlmacen.dart'; // Asegúrate de que el nombre del archivo sea correcto


class Almacen extends StatefulWidget {
  final String usuario;
  const Almacen({super.key, required this.usuario});

 @override
 _AlmacenState createState() => _AlmacenState();
}

class _AlmacenState extends State<Almacen> {
   List<Almacenobjeto> objetosAlmacen = [];
  ControladorAlmacen controlador = ControladorAlmacen();

  @override
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
        title: const Text('Almacén', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajusta el margen
          height: MediaQuery.of(context).size.height * 0.08, // Ajusta la altura
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
                    MaterialPageRoute(builder: (context) => Altas(usuario: widget.usuario)),
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
                    MaterialPageRoute(builder: (context) => Bajas(usuario: widget.usuario)),
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
                    MaterialPageRoute(builder: (context) => Actualizar(usuario: widget.usuario)),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}