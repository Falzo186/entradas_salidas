import 'package:entradas_salidas/Controlador/Controlador_Operador.dart';
import 'package:entradas_salidas/Vista/Vista_AltaOperadores.dart';
import 'package:flutter/material.dart';
import 'package:entradas_salidas/Vista/Vista_DetallesOperador.dart';
import '../Modelo/Operador.dart';


class VistaOperador extends StatefulWidget {
  

   const VistaOperador({super.key});

  @override
  State<VistaOperador> createState() => _VistaOperadorState();
}

class _VistaOperadorState extends State<VistaOperador> {
   List<Operador> _operadores = [];
  final ControladorOperador controlador = ControladorOperador();

  @override
   void initState() {
  super.initState();
  cargarOperadores();
}

Future<void> cargarOperadores() async {
  List<Operador> listaOperadores = await controlador.getOperadoresDeBD();
  setState(() {
    _operadores = listaOperadores;
  });
}

  @override
 Widget build(BuildContext context) {
  return Scaffold(
     appBar: AppBar(
        title: const Text('Operadores', style: TextStyle(color: Color.fromARGB(255, 255, 253, 253))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
        IconButton(
          icon: const Icon(Icons.add, color: Colors.white, size: 30),
          onPressed: () {
           Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const VistaAltasOperadores()) ) ;
       
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
    body: ListView.separated(
      itemCount: _operadores.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_operadores[index].nombre),
          subtitle: Text(_operadores[index].IdChofer),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalleOperador(operador: _operadores[index]),
              ),
            );
          },
        );
      },
    ),
  );
}
}
