import 'package:entradas_salidas/Controlador/Controlador_ReporteVigilante.dart';
import 'package:entradas_salidas/Modelo/AgendaReturn.dart';
import 'package:entradas_salidas/Modelo/ObservacionVigilante.dart';
import 'package:entradas_salidas/Modelo/ReporteVigilante.dart';
import 'package:flutter/material.dart';

class EntryChecklistScreen extends StatefulWidget {
  final Agenda2 entrada;
  final String usuario;
  const EntryChecklistScreen({super.key, required this.entrada, required this.usuario});

  @override
  _EntryChecklistScreenState createState() => _EntryChecklistScreenState();
}

class _EntryChecklistScreenState extends State<EntryChecklistScreen> {
  controlador_ReporteVigilante controlador = controlador_ReporteVigilante();
  bool neumaticosRevisados = false;
  bool frenosRevisados = false;
  bool lucesRevisadas = false;
  bool fluidosRevisados = false;
  bool claxonRevisado = false;
  bool espejosRevisados = false;
  bool cinturonesSeguridadRevisados = false;
  bool limpiaparabrisasRevisados = false;
  bool kitEmergenciaRevisado = false;
  bool documentacionRevisada = false;
  String cadena = '';
  TextEditingController observacionesController = TextEditingController(); // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Entrada Checklist',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 253, 253),
            fontSize: 25,
          ),
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Elementos:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text('Neumáticos revisados'),
                value: neumaticosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    neumaticosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Frenos revisados'),
                value: frenosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    frenosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Luces revisadas'),
                value: lucesRevisadas,
                onChanged: (bool? value) {
                  setState(() {
                    lucesRevisadas = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Fluidos revisados'),
                value: fluidosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    fluidosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Claxon revisado'),
                value: claxonRevisado,
                onChanged: (bool? value) {
                  setState(() {
                    claxonRevisado = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Espejos revisados'),
                value: espejosRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    espejosRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Cinturones de seguridad revisados'),
                value: cinturonesSeguridadRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    cinturonesSeguridadRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Limpiaparabrisas revisados'),
                value: limpiaparabrisasRevisados,
                onChanged: (bool? value) {
                  setState(() {
                    limpiaparabrisasRevisados = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Kit de emergencia revisado'),
                value: kitEmergenciaRevisado,
                onChanged: (bool? value) {
                  setState(() {
                    kitEmergenciaRevisado = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Documentación revisada'),
                value: documentacionRevisada,
                onChanged: (bool? value) {
                  setState(() {
                    documentacionRevisada = value ?? false;
                  });
                },
              ),
              
              const SizedBox(height: 8),
              const Text('Observaciones:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                controller: observacionesController,
                decoration: const InputDecoration(
                  labelText: 'Ingresa observaciones',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (neumaticosRevisados &&
                      frenosRevisados &&
                      lucesRevisadas &&
                      fluidosRevisados &&
                      claxonRevisado &&
                      espejosRevisados &&
                      cinturonesSeguridadRevisados &&
                      limpiaparabrisasRevisados &&
                      kitEmergenciaRevisado &&
                      documentacionRevisada) {
                    // Acción para guardar la entrada
                    if(await controlador.agregarReporteVigilante(
                      ReporteVigilante(
                        folio: widget.entrada.folio,
                        matriculaCamion: widget.entrada.matriculaCamion,
                        fecha: widget.entrada.fecha,
                        hora: widget.entrada.hora,
                        tipo: 'Entrada',
                        VigilanteAsignado: widget.usuario,
                        Estado: 'Aceptado',
                        Motivo: 'Cumplimiento de checklist, todos los elementos revisados \n revise el panel de observaciones para mas detalles',
                      ),
                    )){
                    await controlador.eliminarAgenda(widget.entrada.folio,widget.entrada.nombreOperador,false,'Entrada');
                    await controlador.agregarObservacionVigilante(
                      ObservacionVigilante(
                        folio: widget.entrada.folio,
                        observacion: observacionesController.text, // Add this line
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Entrada aceptada'),
                          content: const Text('La entrada ha sido aceptada.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                
                              },
                              child: const Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );}
                  } else {
                    String checklistPendiente = '-CheckList pendiente\n';
                    if (!neumaticosRevisados) {
                      checklistPendiente += '-Neumáticos\n';
                    }
                    if (!frenosRevisados) {
                      checklistPendiente += '-Frenos\n';
                    }
                    if (!lucesRevisadas) {
                      checklistPendiente += '-Luces\n';
                    }
                    if (!fluidosRevisados) {
                      checklistPendiente += '-Fluidos\n';
                    }
                    if (!claxonRevisado) {
                      checklistPendiente += '-Claxon\n';
                    }
                    if (!espejosRevisados) {
                      checklistPendiente += '-Espejos\n';
                    }
                    if (!cinturonesSeguridadRevisados) {
                      checklistPendiente += '-Cinturones de seguridad\n';
                    }
                    if (!limpiaparabrisasRevisados) {
                      checklistPendiente += '-Limpiaparabrisas\n';
                    }
                    if (!kitEmergenciaRevisado) {
                      checklistPendiente += '-Kit de emergencia\n';
                    }
                    if (!documentacionRevisada) {
                      checklistPendiente += '-Documentación\n';
                    }
                    setState(() {
                      cadena = checklistPendiente;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                child: const Text('Aceptar Entrada'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (neumaticosRevisados &&
                      frenosRevisados &&
                      lucesRevisadas &&
                      fluidosRevisados &&
                      claxonRevisado &&
                      espejosRevisados &&
                      cinturonesSeguridadRevisados &&
                      limpiaparabrisasRevisados &&
                      kitEmergenciaRevisado &&
                      documentacionRevisada) {
                    // Acción para guardar la entrada
                  } else {
                    String checklistPendiente = 'Check list pendiente,revise el panel de observaciones para mas detalles \n';
                    checklistPendiente += 'No se completo el check list de:\n';
                    if (!neumaticosRevisados) {
                      checklistPendiente += '-Neumáticos\n';
                    }
                    if (!frenosRevisados) {
                      checklistPendiente += '-Frenos\n';
                    }
                    if (!lucesRevisadas) {
                      checklistPendiente += '-Luces\n';
                    }
                    if (!fluidosRevisados) {
                      checklistPendiente += '-Fluidos\n';
                    }
                    if (!claxonRevisado) {
                      checklistPendiente += '-Claxon\n';
                    }
                    if (!espejosRevisados) {
                      checklistPendiente += '-Espejos\n';
                    }
                    if (!cinturonesSeguridadRevisados) {
                      checklistPendiente += '-Cinturones de seguridad\n';
                    }
                    if (!limpiaparabrisasRevisados) {
                      checklistPendiente += '-Limpiaparabrisas\n';
                    }
                    if (!kitEmergenciaRevisado) {
                      checklistPendiente += '-Kit de emergencia\n';
                    }
                    if (!documentacionRevisada) {
                      checklistPendiente += '-Documentación\n';
                    }
                     if (await controlador.agregarReporteVigilante(
                      ReporteVigilante(
                        folio: widget.entrada.folio,
                        matriculaCamion: widget.entrada.matriculaCamion,
                        fecha: widget.entrada.fecha,
                        hora: widget.entrada.hora,
                        tipo: 'Entrada',
                        VigilanteAsignado: widget.usuario,
                        Estado: 'Negado',
                        Motivo: checklistPendiente,
                      ),
                    )){
                  await controlador.eliminarAgenda(widget.entrada.folio,widget.entrada.nombreOperador,true,'Entrada');
                    await controlador.agregarObservacionVigilante(
                      ObservacionVigilante(
                        folio: widget.entrada.folio,
                        observacion: observacionesController.text, // Add this line
                      ),
                    );}
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Entrada rechazada'),
                          content: const Text('se ha rechazado la entrada, rebice el panel de observaciones para mas detalles.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                
                              },
                              child: const Text('cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                child: const Text('Negar Entrada'),
              ),
              if (cadena.isNotEmpty)
                Text(
                  'Elementos pendientes:\n$cadena',
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
