
import 'package:flutter/material.dart';
import '../Modelo/Operador.dart';
class DetalleOperador extends StatelessWidget {
  final Operador operador;

  const DetalleOperador({required this.operador, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de ${operador.nombre}',),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Matrícula del Camión: ${operador.IdChofer}'),
          ),
          ListTile(
            title: Text('Nombre del Chofer: ${operador.nombre}'),
          ),
          ListTile(
            title: Text('Licencia de Conducir: ${operador.licenciaConducir}'),
          ),
          ListTile(
            title: Text('Contacto: ${operador.contacto}'),
          ),
          ListTile(
            title: Text('Experiencia: ${operador.experiencia} años'),
          ),
          ListTile(
            title: Text('Historial de Viajes: ${operador.historialViajes.join(', ')}'),
          ),
          ListTile(
            title: Text('Calificaciones: ${operador.calificaciones.join(', ')}'),
          ),
          ListTile(
            title: Text('Estado de Salud: ${operador.estadoSalud}'),
          ),
          ListTile(
            title: Text('Documentos de Identificación: ${operador.documentosIdentificacion.join(', ')}'),
          ),
          ListTile(
            title: Text('Certificados de Capacitación: ${operador.certificadosCapacitacion.join(', ')}'),
          ),
          ListTile(
            title: Text('Registro de Infracciones: ${operador.registroInfracciones.join(', ')}'),
          ),
        ],
      ),
    );
  }
}
